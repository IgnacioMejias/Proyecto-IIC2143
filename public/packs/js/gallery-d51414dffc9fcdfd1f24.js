/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/gallery.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/gallery.js":
/*!*****************************************!*\
  !*** ./app/javascript/packs/gallery.js ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

// Show gallery when pressing image ALSO not clickable rest of page
var backgroundPage = document.querySelector('.main-container');
var image = document.querySelector('.gallery__image-container');
var gallery = document.querySelector('.modal-gallery__background');
var mainPage = document.querySelector('.main-container');
image.addEventListener('click', function () {
  gallery.style.display = 'block';
  mainPage.style.pointerEvents = 'none';
  gallery.style.pointerEvents = 'all';
}); // Hide gallery when pressing close button & enable clicks

var closeBtn = document.querySelector('.modal-gallery__close');
closeBtn.addEventListener('click', function () {
  gallery.style.display = 'none';
  mainPage.style.pointerEvents = 'all';
}); // Change image when pressing icons

var imageUrls = [document.getElementById("g1").src, document.getElementById("g2").src, document.getElementById("g3").src, document.getElementById("g4").src];
var principalImage = document.querySelector('.gallery__image-container');
var image1 = document.getElementById("g1");
image1.addEventListener('click', function () {
  principalImage.style.backgroundImage = "url(".concat(imageUrls[0], ")");
});
var image2 = document.getElementById("g2");
image2.addEventListener('click', function () {
  principalImage.style.backgroundImage = "url(".concat(imageUrls[1], ")");
});
var image3 = document.getElementById("g3");
image3.addEventListener('click', function () {
  principalImage.style.backgroundImage = "url(".concat(imageUrls[2], ")");
});
var image4 = document.getElementById("g4");
image4.addEventListener('click', function () {
  principalImage.style.backgroundImage = "url(".concat(imageUrls[3], ")");
}); // Change image modal when pressing icons

var modalImageUrls = [document.getElementById("mg1").src, document.getElementById("mg2").src, document.getElementById("mg3").src, document.getElementById("mg4").src];
var principalModalImage = document.querySelector('.modal-gallery__background');
var modalImages = [document.getElementById("mg1"), document.getElementById("mg2"), document.getElementById("mg3"), document.getElementById("mg4")];
var actualImage = 0;
modalImages[0].addEventListener('click', function () {
  actualImage = 0;
  changeImage(actualImage);
});
modalImages[1].addEventListener('click', function () {
  actualImage = 1;
  changeImage(actualImage);
});
modalImages[2].addEventListener('click', function () {
  actualImage = 2;
  changeImage(actualImage);
});
modalImages[3].addEventListener('click', function () {
  actualImage = 3;
  changeImage(actualImage);
});
var previusBtn = document.querySelector('.modal-gallery__previus');
var nextBtn = document.querySelector('.modal-gallery__next');
previusBtn.addEventListener('click', function () {
  if (actualImage == 0) {
    actualImage = 3;
    changeImage(actualImage);
  } else {
    actualImage = actualImage - 1;
    changeImage(actualImage);
  }
});
nextBtn.addEventListener('click', function () {
  if (actualImage == 3) {
    actualImage = 0;
    changeImage(actualImage);
  } else {
    actualImage = actualImage + 1;
    changeImage(actualImage);
  }
});

function changeImage(actualImage) {
  principalModalImage.style.backgroundImage = "url(".concat(modalImageUrls[actualImage], ")");

  for (i = 0; i < modalImages.length; i++) {
    if (i != actualImage) {
      modalImages[i].style.opacity = '0.5';
    } else {
      modalImages[i].style.opacity = '1';
    }
  }
}

/***/ })

/******/ });
//# sourceMappingURL=gallery-d51414dffc9fcdfd1f24.js.map