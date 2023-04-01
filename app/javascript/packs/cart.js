let minusBtn = document.querySelector('.input__minus');
let plusBtn = document.querySelector('.input__plus');
let userInput = document.querySelector('.input__number');
let userInputNumber = 1;

plusBtn.addEventListener('click', function() {
    userInputNumber++;
    userInput.value = userInputNumber;
});

minusBtn.addEventListener('click', function() {
    if (userInputNumber > 0) {
        userInputNumber--;
        userInput.value = userInputNumber;
    }

});

// Open cart when pressing cart icon ALSO not clickable rest of page
const cartIcon = document.querySelector('.header__cart-icon');
let cartModal = document.querySelector('.cart-modal');
let mainPage = document.querySelector('.main-container');
let priceModal = document.querySelector('.cart-modal__product-price');
let priceModalNumber = document.querySelector('.details__price')
let priceModalNumberValue = parseInt(priceModalNumber.innerText);
let cartModalCheckout = document.querySelector('.cart-modal__checkout');

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


// functions
function numberWithDot(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}
