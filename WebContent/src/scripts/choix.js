const closeWindow = (message1,message2,idsource) => {
  window.opener.postMessage({ id:idsource,msg1: message1,msg2: message2 }, '*');
  window.close();
};
 