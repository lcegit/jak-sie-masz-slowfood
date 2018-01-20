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

function getPosition(options) {
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
}

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

var style = [{
    "elementType": "geometry",
    "stylers": [{
      "color": "#f5f5f5"
    }]
  },
  {
    "elementType": "labels.icon",
    "stylers": [{
      "visibility": "off"
    }]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [{
      "color": "#616161"
    }]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [{
      "color": "#f5f5f5"
    }]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [{
      "color": "#bdbdbd"
    }]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [{
      "color": "#eeeeee"
    }]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [{
      "color": "#757575"
    }]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [{
      "color": "#e5e5e5"
    }]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [{
      "color": "#9e9e9e"
    }]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [{
      "color": "#ffffff"
    }]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [{
      "color": "#757575"
    }]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [{
      "color": "#dadada"
    }]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [{
      "color": "#616161"
    }]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [{
      "color": "#9e9e9e"
    }]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [{
      "color": "#e5e5e5"
    }]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [{
      "color": "#eeeeee"
    }]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [{
      "color": "#c9c9c9"
    }]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [{
      "color": "#9e9e9e"
    }]
  }
]
