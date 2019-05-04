jQuery(init);

function init($){

let $check = document.querySelector( "#myCheck");
$check.addEventListener("click", showHide );


let $check2 = document.querySelector( "#myCheck2");
$check2.addEventListener("click", showHide2 );



function showHide( ){
    let x = this.checked;
 
    if ( x == false ){
        $("#newAddForm").hide();
    } else {
     $("#newAddForm").show();
    }
    
 };
  

 function showHide2( ){
    let x = this.checked;
    console.log(x);
    if ( x == false ){
        $("#newCardForm").hide();
    } else {
     $("#newCardForm").show();
    }
    
 };




}