jQuery(init);

function init($){


 let items = document.querySelectorAll(".menuItems");


items.forEach((it) => {
    it.addEventListener('click', () => {
        updateCart();
      });
});

function updateCart(){
    let count = [];
    items.forEach((item) => {
        count.push(parseInt(item.value));
      });
      
    let sum = count.reduce(getSum);
      
    function getSum(total, num) {
        return total + num;
      }
  
  
//      cart.setAttribute("data-count", sum);
      $("#ex4 span").attr("data-count", sum);
      
      sessionStorage.setItem("sum", sum);
}


}