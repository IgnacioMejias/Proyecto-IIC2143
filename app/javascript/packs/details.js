let productPrice = document.querySelector('.details__price')
let productPriceValue = parseInt(productPrice.innerText);
function numberWithDot(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}
productPrice.innerText = `$${numberWithDot(productPriceValue)}`
