jQuery(init);

function init($){


 $("#ex4 span").attr("data-count", sessionStorage.getItem("sum"));


$('#back_btn').on('click', function(e){
    e.preventDefault();
    window.history.back();
});



}
 
