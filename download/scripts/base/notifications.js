(function () {
 'use strict';
 var queue=[], active=null, ready=false, sessionNoticeShown=false;
 function labels(){return window.GalaNoticeLabels || {title:'Notification',close:'Close',ok:'OK',login:'Log in'};}
 function element(tag,className,text){var node=document.createElement(tag);node.className=className;if(text!==undefined)node.textContent=String(text);return node;}
 function pump(){
  if(!ready || active || !queue.length)return;
  var item=queue.shift(), previous=document.activeElement, dialog=element('dialog','gala-dialog');
  var title=element('h2','gala-dialog-title',item.title || labels().title), body=element('div','gala-dialog-message',item.message);
  title.id='gala-notice-title';body.id='gala-notice-message';
  dialog.setAttribute('role','alertdialog');dialog.setAttribute('aria-modal','true');dialog.setAttribute('aria-labelledby',title.id);dialog.setAttribute('aria-describedby',body.id);
  var dismiss=element('button','gala-dialog-close','×');dismiss.type='button';dismiss.setAttribute('aria-label',labels().close);
  var actions=element('div','gala-message-actions'), ok=element('button','gala-notice-button',labels().ok);ok.type='button';
  if(item.login){var login=element('a','gala-notice-button gala-notice-primary',labels().login);login.href='index.php';login.target='_top';actions.appendChild(login);}
  actions.appendChild(ok);dialog.appendChild(dismiss);dialog.appendChild(title);dialog.appendChild(body);dialog.appendChild(actions);
  var completed=false;
  function finish(){
   if(completed)return;completed=true;
   if(typeof dialog.close==='function' && dialog.open)dialog.close();
   dialog.remove();active=null;
   if(previous && previous.isConnected && typeof previous.focus==='function')previous.focus();
   try {if(typeof item.callback==='function')item.callback();} finally {pump();}
  }
  dismiss.addEventListener('click',finish);ok.addEventListener('click',finish);
  dialog.addEventListener('cancel',function(event){event.preventDefault();finish();});
  dialog.addEventListener('keydown',function(event){
   if(event.key==='Escape'){event.preventDefault();finish();return;}
   if(event.key!=='Tab')return;
   var controls=dialog.querySelectorAll('button,a[href]'), first=controls[0],last=controls[controls.length-1];
   if(event.shiftKey && document.activeElement===first){event.preventDefault();last.focus();}
   else if(!event.shiftKey && document.activeElement===last){event.preventDefault();first.focus();}
  });
  document.body.appendChild(dialog);active=dialog;
  if(typeof dialog.showModal==='function')dialog.showModal();else {dialog.setAttribute('open','');dialog.classList.add('gala-dialog-fallback');}
  ok.focus();
 }
 window.GalaNotice={
  alert:function(message,callback,options){options=options || {};queue.push({message:String(message==null?'':message),callback:callback,title:options.title,login:options.login});pump();},
  notify:function(message){
   if(!ready){document.addEventListener('DOMContentLoaded',function(){window.GalaNotice.notify(message);},{once:true});return;}
   var host=document.getElementById('gala-notification-stack');
   if(!host){host=element('div','gala-notification-stack');host.id='gala-notification-stack';document.body.appendChild(host);}
   var toast=element('section','gala-toast'), text=element('div','gala-toast-message',message), close=element('button','gala-toast-close','×');
   text.setAttribute('role','status');text.setAttribute('aria-live','polite');close.type='button';close.setAttribute('aria-label',labels().close);
   close.addEventListener('click',function(){toast.remove();});toast.appendChild(text);toast.appendChild(close);host.appendChild(toast);
  }
 };
 function initialize(){
  ready=true;
  var notice=document.querySelector('[data-gala-login-notice]');
  if(notice){var message=notice.querySelector('.gala-message-text').textContent;notice.remove();window.GalaNotice.alert(message,null,{login:true});}
  // Expired sessions can return a login page to an AJAX request instead of JSON.
  if(window.jQuery)window.jQuery(document).on('ajaxComplete.galaNotice',function(event,xhr){
   if(sessionNoticeShown || typeof xhr.responseText!=='string' || xhr.responseText.indexOf('data-gala-login-notice')<0)return;
   var response=new DOMParser().parseFromString(xhr.responseText,'text/html');
   var sessionNotice=response.querySelector('[data-gala-login-notice] .gala-message-text');
   if(!sessionNotice)return;
   sessionNoticeShown=true;window.GalaNotice.alert(sessionNotice.textContent,null,{login:true});
  });
  pump();
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',initialize,{once:true});else initialize();
})();
