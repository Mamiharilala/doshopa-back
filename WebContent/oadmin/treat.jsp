<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.MapModel"%>
<%@ page import="main.*"%>
<%@ page import="java.lang.reflect.Field"%>
<%@ page import="front.*"%>
<%
	try {
		if (request.getParameter("mode").compareTo("insert") == 0) {
			PageCreate pv = new PageCreate(new MapModel());
			pv.completeAllField(request);
			pv.getMapModel().insertIntoTable(null);
		}
		if (request.getParameter("mode").compareTo("update") == 0) {
			String classPath = request.getParameter("class");
			Class <?> t = Class.forName(classPath);
			MapModel model = (MapModel)t.newInstance();
			model.setId(request.getParameter("id"));
			PageUpdate pv = new PageUpdate();
			pv.setMapModel(model);
			pv.completeAllField(request);
			pv.getMapModel().updateIntoTable(null);
		}
		if (request.getParameter("mode").compareTo("delete") == 0) {
			MapModel map = new MapModel();
			map.setId(request.getParameter("id"));
			map.deleteIntoTable(null);
		}
	} catch (Exception e) {
		e.printStackTrace();
%>
<script language="JavaScript"> 
	alert("<%=e.getMessage()%>");
    history.back();
</script>
<%
	}
%>
<script>window.location.replace('<%=request.getParameter("after")%>');</script>