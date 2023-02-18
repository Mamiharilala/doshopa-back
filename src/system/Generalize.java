package system;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

import util.DBConnect;

public class Generalize {
	public static String valStringQuery(String strTypeField,Object val) {
		if(val==null)return null;
		if(strTypeField.compareTo("BOOLEAN") == 0||strTypeField.compareTo("DOUBLE") == 0||strTypeField.compareTo("INT") == 0||strTypeField.compareTo("INTEGER") == 0||strTypeField.compareTo("FLOAT") == 0) {
			return String.valueOf(val);
		}
		return "'"+String.valueOf(val)+"'";
	}
	public static String[] getDBColumn(MapModel mm, Connection c) throws Exception {
		ArrayList<String> ans = new ArrayList();
		PreparedStatement pstmt = null;
		try {
			String sql = "SELECT attname  FROM   pg_attribute WHERE  attrelid = ?::regclass AND attnum > 0 AND    NOT attisdropped ORDER  BY attnum";
			// System.out.println(sql);
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, mm.getCompleteTableName());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				// System.out.println(rs.getString(1));
				ans.add(rs.getString(1));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw e;
		}
		return ans.toArray(new String[ans.size()]);
	}

	public static Field[] getCommonField(MapModel mm, Connection c) throws Exception {
		boolean isNull = false;
		ArrayList<Field> ans = new ArrayList();
		try {
			if (c == null) {
				c = new DBConnect().getConnection();
				isNull = true;
			}
			Field[] fields = getAllFields(mm);
			String[] cols = getDBColumn(mm, c);
			for (int i = 0; i < fields.length; i++) {
				for (int j = 0; j < cols.length; j++) {
					// System.out.println(fields[i].getName().trim().toUpperCase()+"
					// "+cols[j].trim().toUpperCase());
					if (fields[i].getName().trim().toUpperCase().compareTo(cols[j].trim().toUpperCase()) == 0) {
						ans.add(fields[i]);
					}
				}
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (isNull && c != null)
				c.close();
		}
		return ans.toArray(new Field[ans.size()]);
	}

	public static Object[] getListObject(MapModel mm, Connection c) throws Exception {
		String sql = "select * from " + mm.getCompleteTableName();
		boolean isNullConn = false;
		try {
			if (c == null) {
				c = new DBConnect().getConnection();
				isNullConn = true;
			}
			return getListObject(mm, sql, c);
		} catch (Exception e) {
			throw e;
		} finally {
			if (isNullConn && c != null) {
				c.close();
			}
		}
	}

	public static Object[] getListObjectWithWhere(MapModel mm, String where, Connection c) throws Exception {
		boolean isNullConn = false;
		String sql = "select * from " + mm.getCompleteTableName() + " where 1<2 " + where;
		try {
			if (c == null) {
				c = new DBConnect().getConnection();
				isNullConn = true;
			}
			return getListObject(mm, sql, c);
		} catch (Exception e) {
			throw e;
		} finally {
			if (isNullConn && c != null) {
				c.close();
			}
		}
	}

	public static Object getById(MapModel mm, Connection c) throws Exception {
		boolean isNullConn = false;
		try {
			if (c == null) {
				c = new DBConnect().getConnection();
				isNullConn = true;
			}
			Object[] data = Generalize.getListObjectWithWhere(mm, " AND ID='" + mm.getId() + "'", c);
			if (data.length > 0) {
				return data[0];
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (isNullConn && c != null) {
				c.close();
			}
		}
		return null;
	}

	public static int getCountTable(MapModel mm,String where, Connection c) throws Exception {
		int len = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
 		boolean isNullConn = false;
		try {
			if (c == null) {
				c = new DBConnect().getConnection();
				isNullConn = true;
			}
			String sql = "select count(*) from " + mm.getCompleteTableName()+" WHERE 1<2 " +where;
 			pstmt = c.prepareStatement(sql);
			rs = pstmt.executeQuery();
 			while (rs.next()) {
				len = rs.getInt(1);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (c != null && isNullConn) {
				c.close();
			}
		}
		return len;
	}
	
	public static int getCountSQL(MapModel mm,String sql, Connection c) throws Exception {
		int len = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
 		boolean isNullConn = false;
		try {
			if (c == null) {
				c = new DBConnect().getConnection();
				isNullConn = true;
			}
			sql = "select count(*) from (" + sql+") as t";
 			pstmt = c.prepareStatement(sql);
			rs = pstmt.executeQuery();
 			while (rs.next()) {
				len = rs.getInt(1);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (c != null && isNullConn) {
				c.close();
			}
		}
		return len;
	}

	public static Object[] getListObject(MapModel mm, String sql, Connection c) throws Exception {
		Vector ans = new Vector();
		MapModel o = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String columnName = "";
		String methodName = "";
		Method m = null;
		boolean isNullConn = false;
		try {
			if (c == null) {
				c = new DBConnect().getConnection();
				isNullConn = true;
			}
			mm.controlSelect(c);
			Field[] listFieldName = Generalize.getCommonField(mm, c);
			pstmt = c.prepareStatement(sql);
			rs = pstmt.executeQuery();
			String simpleName = "";
			while (rs.next()) {
				o = mm.getClass().newInstance();
				for (int j = 0; j < listFieldName.length; j++) {
					columnName = listFieldName[j].getName();
					methodName = "set" + (columnName.charAt(0) + "").toUpperCase() + (columnName.substring(1));
					
					columnName = columnName.toUpperCase();
					m = mm.getClass().getMethod(methodName, new Class[] { listFieldName[j].getType() });
					simpleName = listFieldName[j].getType().getSimpleName().toUpperCase();
					if (simpleName.compareTo("STRING") == 0) {
						m.invoke(o, rs.getString(columnName));
					} else if (simpleName.compareTo("DOUBLE") == 0) {
						m.invoke(o, rs.getDouble(columnName));
					} else if (simpleName.compareTo("FLOAT") == 0) {
						m.invoke(o, rs.getFloat(columnName));
					} else if (simpleName.compareTo("DATE") == 0) {
						m.invoke(o, rs.getDate(columnName));
					} else if (simpleName.compareTo("INT") == 0 || simpleName.compareTo("INTEGER") == 0) {
						m.invoke(o, rs.getInt(columnName));
					}else if (simpleName.compareTo("BOOLEAN") == 0) {
						m.invoke(o, rs.getBoolean(columnName));
					}
				}
				ans.add(o);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (isNullConn && c != null) {
				c.close();
			}
		}
		Object[] data = (Object[]) java.lang.reflect.Array.newInstance(mm.getClass().newInstance().getClass(),
				ans.size());
		ans.copyInto(data);
		return data;
	}

	public static Field[] getAllFields(MapModel t) {
		List<Field> fields = new ArrayList<>();
		Class clazz = t.getClass();
		while (clazz != Object.class) {
			fields.addAll(Arrays.asList(clazz.getDeclaredFields()));
			clazz = clazz.getSuperclass();
		}
		return fields.toArray(new Field[fields.size()]);
	}
}
