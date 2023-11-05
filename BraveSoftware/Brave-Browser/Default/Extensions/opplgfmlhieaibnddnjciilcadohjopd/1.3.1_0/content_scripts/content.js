
var success=document.querySelector('body > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(4) > td > table > tbody > tr:nth-child(3) > td > table > tbody > tr > td > table > tbody > tr > td > table > tbody > tr > td > table > tbody > tr > td > table > tbody > tr:nth-child(1) > td > p')
var error=document.querySelector('body > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(4) > td > table > tbody > tr:nth-child(3) > td > table:nth-child(1) > tbody > tr > td > table > tbody > tr > td > table > tbody > tr > td > table > tbody > tr:nth-child(3) > td')
if(success){chrome.runtime.sendMessage({req:"Close Tab"})}
if(error&&!error.textContent){chrome.storage.sync.get(['username','password'],({username,password})=>{if(username&&password&&username.length>0&&password.length>0){document.querySelectorAll('input')[0].value=username
document.querySelectorAll('input')[1].value=password
document.querySelectorAll('input')[3].click();}else{chrome.runtime.sendMessage({req:"Add Notif"})}})}else{chrome.runtime.sendMessage({req:"Incorrect Notif"})}