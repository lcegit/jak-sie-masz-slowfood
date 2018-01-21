//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require gmaps
//= require_tree .


document.addEventListener("turbolinks:load", function () {
    setUpObserver();

    if (document.body.contains(document.getElementById('map'))) {
        getPosition({
            enableHighAccuracy: true
        }).then(function (position) {
            var c = {
                latitude: position.coords.latitude,
                longitude: position.coords.longitude
            };
            setCookie('geocoderLocation', JSON.stringify(c))
                .then(function () {
                    redirectWithLocation();
                    document.body.dataset.geocoded = true;
                }).catch(function (error) {
                console.log(error);
            });
        }).catch(function (error) {
            console.log(error);
        });
    }

});

function getPosition(options) {
    if (document.body.dataset.env === 'test') {
        return new Promise(function (resolve) {
            var fakePosition = JSON.parse(document.getElementById('fake_position').content);
            resolve({
                coords: {
                    latitude: fakePosition.coords.latitude,
                    longitude: fakePosition.coords.longitude
                }
            });
        });
    } else {
        return new Promise(function (resolve, reject) {
            navigator.geolocation.getCurrentPosition(function (position) {
                return resolve(position);
            }, function (error) {
                return reject(error);
            }, options);
        });
    }
}

function redirectWithLocation() {
    var url = new URL(window.location.href);

    if (document.body.dataset.geocoded !== 'true') {
        window.location.replace(url);
    }
}

function setCookie(name, value) {
    var days = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 7;
    var path = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : '/';

    return new Promise(function (resolve) {
        var expires = new Date(Date.now() + days * 864e5).toUTCString();
        document.cookie = name + '=' + encodeURIComponent(value) + '; expires=' + expires + '; path=' + path;
        resolve();
    });
}

function getCookie(name) {
    return new Promise(function (resolve) {
        const value = document.cookie.split('; ').reduce(function (r, v) {
            const parts = v.split('=');
            return parts[0] === name ? decodeURIComponent(parts[1]) : r
        }, '');
        resolve(value);
    })
}

function setUpObserver() {
    const element = document.querySelector('body');
    var callback = function (mutations) {
        mutations.forEach(function (mutation) {
            if (mutation.type === "attributes") {
                initiateMap()
            }
        });
    };
    var observer = new MutationObserver(callback);
    observer.observe(element, {
        attributes: true
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
