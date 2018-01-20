//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .
//= require gmaps

document.addEventListener("turbolinks:load", function() {
  initiateMap();
  getPosition({
    enableHighAccuracy: true
  }).then(function(position) {
    var c = {
      latitude: position.coords.latitude,
      longitude: position.coords.longitude
    };
    setCookie('geocoderLocation', JSON.stringify(c)).then(function() {
      redirectWithLocation();
    }).catch(function(error) {
      return console.log(error);
    });
  }).catch(function(error) {
    return console.log(error);
  });
});

getPosition = function getPosition(options) {
  if (document.body.dataset.env === 'test') {
    return new Promise(function(resolve) {
      var fakePosition = JSON.parse(document.getElementById('fake_position').content);
      resolve({
        coords: {
          latitude: fakePosition.coords.latitude,
          longitude: fakePosition.coords.longitude
        }
      });
    });
  } else {
    return new Promise(function(resolve, reject) {
      navigator.geolocation.getCurrentPosition(function(position) {
        return resolve(position);
      }, function(error) {
        return reject(error);
      }, options);
    });
  }
};

function redirectWithLocation(position) {
  var url = new URL(window.location.href);

  if (document.body.dataset.geocoded != 'true') {
    window.location.replace(url);
    document.body.dataset.geocoded = true;
  }
}

function setCookie(name, value) {
  var days = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 7;
  var path = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : '/';

  return new Promise(function(resolve) {
    var expires = new Date(Date.now() + days * 864e5).toUTCString();
    document.cookie = name + '=' + encodeURIComponent(value) + '; expires=' + expires + '; path=' + path;
    resolve();
  });
}
