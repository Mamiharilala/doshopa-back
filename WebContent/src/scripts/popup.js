
let newWindow;
const openNewWindow = (link) => {
  const params = `scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=800,height=650,left=500,top=55`;
  newWindow = window.open(link, '', params);
};
const response = document.getElementById('response');

window.addEventListener('message', (event) => {
  if (event.data.msg1!=null) {
    document.getElementById(event.data.id.concat('id')).value  = event.data.msg1;
    document.getElementById(event.data.id).value  = event.data.msg1;
    document.getElementById(event.data.id.concat('lib')).value  = event.data.msg2;
  }
});
const closeWindow = (message1,message2,idsource) => {
	  window.opener.postMessage({ id:idsource,msg1: message1,msg2: message2 }, '*');
	  window.close();
};