// Show gallery when pressing image ALSO not clickable rest of page
let backgroundPage = document.querySelector('.main-container');
const image = document.querySelector('.gallery__image-container');
let gallery = document.querySelector('.modal-gallery__background');
let mainPage = document.querySelector('.main-container');

image.addEventListener('click', function() {
    gallery.style.display = 'block';
    mainPage.style.pointerEvents = 'none';
    gallery.style.pointerEvents = 'all';
});

// Hide gallery when pressing close button & enable clicks
const closeBtn = document.querySelector('.modal-gallery__close');
closeBtn.addEventListener('click', function() {
    gallery.style.display = 'none';
    mainPage.style.pointerEvents = 'all';
});

// Change image when pressing icons
const imageUrls = [
                   document.getElementById("g1").src,
                   document.getElementById("g2").src,
                   document.getElementById("g3").src,
                   document.getElementById("g4").src,
];
const principalImage = document.querySelector('.gallery__image-container');
const image1 = document.getElementById("g1");
image1.addEventListener('click', function() {
    principalImage.style.backgroundImage = `url(${imageUrls[0]})`;
});
const image2 = document.getElementById("g2");
image2.addEventListener('click', function() {
    principalImage.style.backgroundImage = `url(${imageUrls[1]})`;
});
const image3 = document.getElementById("g3");
image3.addEventListener('click', function() {
    principalImage.style.backgroundImage = `url(${imageUrls[2]})`;
});
const image4 = document.getElementById("g4");
image4.addEventListener('click', function() {
    principalImage.style.backgroundImage = `url(${imageUrls[3]})`;
});

// Change image modal when pressing icons
const modalImageUrls = [
    document.getElementById("mg1").src,
    document.getElementById("mg2").src,
    document.getElementById("mg3").src,
    document.getElementById("mg4").src,
];
const principalModalImage = document.querySelector('.modal-gallery__background');

const modalImages = [document.getElementById("mg1"),
                     document.getElementById("mg2"),
                     document.getElementById("mg3"),
                     document.getElementById("mg4")];
let actualImage = 0;
modalImages[0].addEventListener('click', function() {
    actualImage = 0;
    changeImage(actualImage);
});
modalImages[1].addEventListener('click', function() {
    actualImage = 1;
    changeImage(actualImage);
});
modalImages[2].addEventListener('click', function() {
    actualImage = 2;
    changeImage(actualImage);
});
modalImages[3].addEventListener('click', function() {
    actualImage = 3;
    changeImage(actualImage);
});

const previusBtn = document.querySelector('.modal-gallery__previus');
const nextBtn = document.querySelector('.modal-gallery__next');
previusBtn.addEventListener('click', function() {
    if (actualImage == 0){
        actualImage = 3;
        changeImage(actualImage);
    }
    else{
        actualImage = actualImage - 1;
        changeImage(actualImage);
    }
});
nextBtn.addEventListener('click', function() {
    if (actualImage == 3){
        actualImage = 0;
        changeImage(actualImage);
    }
    else{
        actualImage = actualImage + 1;
        changeImage(actualImage);
    }
});
function changeImage(actualImage) {
    principalModalImage.style.backgroundImage = `url(${modalImageUrls[actualImage]})`;
    for (i = 0; i < modalImages.length; i++) {
        if (i != actualImage){
            modalImages[i].style.opacity = '0.5';
        }
        else{
            modalImages[i].style.opacity = '1';
        }
    }

}