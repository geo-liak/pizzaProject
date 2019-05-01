jQuery(init);

function init($){


let $loginForm = document.querySelector("#login-form");
let $signUpForm = document.querySelector("#signup-form");
let $forgetForm = document.querySelector("#forget-form");
let $login_btn = document.querySelector("#login_btn");
let $forgetlink = document.querySelector("#forgot-tab");
let $modal = document.querySelector(".modal-content");

document.querySelector(".nav-item-login").addEventListener("click", function(){
   
 
    $forgetForm.style.display = "none";
    $signUpForm.style.display = "none";
    $loginForm.style.display = "block";
   
});

document.querySelector(".nav-item-signup").addEventListener("click", function(){
    

    $forgetForm.style.display = "none";
    $loginForm.style.display = "none";
    $signUpForm.style.display = "block";
    
});


$forgetForm.style.display = "none";

$forgetlink.addEventListener("click", seeSawForget );

function seeSawForget() {
   
    
    if ($forgetForm.style.display === "none"){
        $forgetForm.style.display = "block";
        $loginForm.style.display = "none";
    } else {
        $forgetForm.style.display = "none";
        $loginForm.style.display = "block";
    }
    
  }

  

  















}