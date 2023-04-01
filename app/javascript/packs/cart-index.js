const cartIcon = document.querySelector('.header__cart-icon');
let cartModal = document.querySelector('.cart-modal');

let openCart = 0
cartIcon.addEventListener('click', function() {
    if (openCart == 0) {
        cartModal.style.display = 'block';
        openCart = 1;
    }
    else{
        cartModal.style.display = 'none';
        openCart = 0;
    }
});

const sendAll = document.querySelector('.cart-modal__master-send');
var day_forms = document.querySelectorAll('.cart-modal__form-days');
var date_forms = document.querySelectorAll('.cart-modal__form-date');
const days = document.querySelector('.cart-modal__days-value');
const date = document.querySelector('.cart-modal__date-value');
document.querySelector('.cart-modal__days-value').onchange = function() {change_price()};

let send_buttons = document.querySelectorAll('.cart-modal__request');

sendAll.addEventListener('click', function() {
    console.log('clicado')

    for(var i=0; i< day_forms.length; i++){
        day_forms[i].value = days.value;
        date_forms[i].value = date.value;
        send_buttons[i].click();
        
    }
    
});

var original_price = document.querySelector('.cart-modal__product-new-price span').innerText;

function change_price() {

    let regex = /\./g;
    let price_no_dot = original_price.replace(regex, "");
    let price_no_cash = price_no_dot.replace("$", "");
    var days = document.querySelector('.cart-modal__days-value').value;
    if (days < 1){
        days = 1;
        document.querySelector('.cart-modal__days-value').value = 1;
    }
    var price_total = document.querySelector('.cart-modal__days-value').value * price_no_cash;
    document.querySelector('.cart-modal__product-new-price span').innerText = '$' + price_total.toLocaleString('en-US').replace(",", ".");
}