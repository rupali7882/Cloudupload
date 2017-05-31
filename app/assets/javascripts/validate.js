$(document).ready(function(){
  
  // Registration form validation
  $("#new_join").validate({
    rules: {
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true
      }
    },
    messages: {
      "user[email]": {
        required: "Please enter email.",
        email: "Please enter a valid email address."
      },
      "user[password]": {
        required: "Please enter password.",
      }
    }
  });
  
  // Login form validation
  
  $("#new_user").validate({
    rules: {
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true
      }
    },
    messages: {
      "user[email]": {
        required: "Please enter email.",
        email: "Please enter a valid email address."
      },
      "user[password]": {
        required: "Please enter password.",
      }
    }
  });

  // share file form validation

  $("#sharefile").validate({
    rules: {
      "email": {
        required: true,
        email: true
      },
       messages: {
      "email": {
        required: "Please enter email.",
        email: "Please enter a valid email address."
      }
    }
  }
  });


})