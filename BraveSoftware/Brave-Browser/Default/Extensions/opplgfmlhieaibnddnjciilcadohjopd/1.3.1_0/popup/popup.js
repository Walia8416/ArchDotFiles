
$(()=>{chrome.storage.sync.get(['username'],({username})=>{if(username&&username.length>0){$('#editbtn').text('Change Login Credentials')}
else{$('#editbtn').text('Add Login Credentials')}})
$('#editbtn').click(()=>{$('.alert').addClass('hide')
$('#editbtn').addClass('hide');$('.Form').removeClass('hide');})
$('#submit').click(()=>{var username=$('#username').val();var password=$('#password').val();if(username&&password&&username.length>0&&password.length>0){chrome.storage.sync.set({username,password})
$('.alertInfo').html(`<div class="alert alert-success p-1 text-center">
            Login Credentials Updated
         </div>`)
$('#editbtn').removeClass('hide');$('.Form').addClass('hide');$('#username').val('');$('#password').val('');$('#editbtn').text('Change Login Credentials')}else{$('.alertInfo').html(`<div class="alert alert-danger p-1 text-center">
            Fill The Credentials
         </div>`)}})})