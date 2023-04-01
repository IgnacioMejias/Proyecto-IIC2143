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
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/cart-index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/cart-index.js":
/*!********************************************!*\
  !*** ./app/javascript/packs/cart-index.js ***!
  \********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

var cartIcon = document.querySelector('.header__cart-icon');
var cartModal = document.querySelector('.cart-modal');
var openCart = 0;
cartIcon.addEventListener('click', function () {
  if (openCart == 0) {
    cartModal.style.display = 'block';
    openCart = 1;
  } else {
    cartModal.style.display = 'none';
    openCart = 0;
  }
});
var sendAll = document.querySelector('.cart-modal__master-send');
var day_form_0 = document.querySelector('.cart-modal__form-days-0');
var day_form_1 = document.querySelector('.cart-modal__form-days-1');
var date_form_0 = document.querySelector('.cart-modal__form-date-0');
var date_form_1 = document.querySelector('.cart-modal__form-date-1');
var days = document.querySelector('.cart-modal__days-value');
var date = document.querySelector('.cart-modal__date-value');
var send_button_0 = document.querySelector('.cart-modal__request-0');
var send_button_1 = document.querySelector('.cart-modal__request-1');
sendAll.addEventListener('click', function () {
  day_form_0.value = days.value;
  date_form_0.value = date.value;
  send_button_0.click();
});
send_button_0.addEventListener('click', function () {
  day_form_1.value = day_form_0.value;
  date_form_1.value = date_form_0.value;
  send_button_1.click();
});

/***/ })

/******/ });
//# sourceMappingURL=cart-index-18d32c3798724a6f6545.js.map