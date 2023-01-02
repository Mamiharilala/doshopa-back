package front;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import system.MapModel;

public class PageChoice extends PageSearch {
	String champUser;
	public PageChoice(MapModel map,String champ) throws Exception {
		super(map);
		this.setChampUser(champ);
	}
	
	public void prepareData(HttpServletRequest request) throws Exception {
		this.setResultDisplay("");
		String []name = this.getColRenameDisplay();
		String header ="<thead><tr><th scope='col'>#</th>";
		for(int i=0;i<name.length;i++) {
			header += "<th scope='col'>"+name[i]+"</th>";
		}
		header+="</tr></thead>";
		name = this.getColDisplay();
		MapModel []data = this.getData();
		String body = "<tbody>";
		Method m = null;
		Object obj = null;
		String methodName = "";
		for(int i=0;i<data.length;i++) {
			methodName = "get" + (this.getChampUser().charAt(0) + "").toUpperCase() + (this.getChampUser().substring(1));
			m = this.getMapModel().getClass().getMethod(methodName, null);
			obj = m.invoke(data[i], null);
			body+="<tr><th scope='row'>" + 
					"						<div class='custom-control custom-radio mb-5'>" + 
					"							<input type='radio' id='customRadio"+i+"' name='customRadio'" + 
					"								onclick='closeWindow(`"+data[i].getId()+"`,`"+obj+"`,`"+request.getParameter("fieldchoice")+"`)'" + 
					"								class='custom-control-input' /> <label" + 
					"								class='custom-control-label' for='customRadio"+i+"'>" + 
					"								Cliquer ici</label>" + 
					"						</div>" + 
					"					</th>";
			for(int j=0;j<name.length;j++){
				methodName = "get" + (name[j].charAt(0) + "").toUpperCase() + (name[j].substring(1));
 				m = this.getMapModel().getClass().getMethod(methodName, null);
				body+="<td>"+m.invoke(data[i], null)+"</td>";
			}
			body+="</tr>";
		}
		this.setResultDisplay(header+body);
	}

	public String getChampUser() {
		return champUser;
	}

	public void setChampUser(String champUser) {
		this.champUser = champUser;
	}
	
}
