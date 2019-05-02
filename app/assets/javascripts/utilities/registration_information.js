document.addEventListener('turbolinks:load', function() {
  password.addEventListener('click', checkPassword)
  password_confirmation.addEventListener('click', checkPassword)
})

function checkPassword() {

  var password = document.getElementById('password');
  var password_confirmation = document.getElementById('password_confirmation');

  if(password_confirmation.value.length == 0 ) {
    password_confirmation.style.backgroundColor = 'white';
  }

  else{
    if(password.value == password_confirmation.value && password.value.length >= 6) {
    
    password_confirmation.style.backgroundColor = 'green';
      message.style.color = 'green';
    }

    else {
      password_confirmation.style.backgroundColor = 'red';
      message.style.color = 'red';
    }
  }
    

}
