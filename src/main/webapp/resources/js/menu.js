jQuery(init);

function init($) {

    let inputs = document.querySelectorAll(".inputs");
    let items = document.querySelectorAll(".menuItems");
    
   let products = {};
   
   
    items.forEach((it) => {
        it.addEventListener('click', () => {
            updateCart();
        });
    });

    function updateCart() {
        let count = [];
         inputs.forEach((input) => {
      let item = input.querySelector(".menuItems");
        count.push(parseInt(item.value));

    });

        console.log(count);
        let sum = count.reduce(getSum);

//      cart.setAttribute("data-count", sum);
        $("#ex4 span").attr("data-count", sum);

        sessionStorage.setItem("sum", sum);
    }

function getSum(total, num) {
            return total + num;
        }

function updateProducts(){
     inputs.forEach((input) => {
      let item = input.querySelector(".menuItems");
      let prodId = input.querySelector(".productId");
        // here we asign "key" as the product id and "value" as the item value.
        products[prodId.value] = item.value;
      
        return products;
})};



    $("#checkout").click(function () {
       updateProducts();

        $.ajax({
            url: "/restaurant/menu",
            type: 'post',
            contentType: 'application/json',
            data: JSON.stringify(products),
            success: function (result) {
                alert("success" + result);
            },
            error: function (result) {
                alert("failure" + result);
            }
        });
    });



}