function initiateMap() {
    getCookie('geocoderLocation').then(function (value) {
        console.log('cookie read');
        const coords = JSON.parse(value);
        map = GMaps({
            div: '#map',
            zoom: 12,
            lat: coords.latitude,
            lng: coords.longitude
        });
        map.addStyle({
            styles: style,
            mapTypeId: 'custom-style'
        });
        map.setStyle('custom-style');
        addMarkers();
        addCenterMarker();
    })
}


function addCenterMarker() {
    map.addMarker({
        lat: map.getCenter().lat(),
        lng: map.getCenter().lng(),
        title: 'Your location',
        infoWindow: {
            content: '<h4>You are here</h4>'
        },
        icon: {
            scaledSize: new google.maps.Size(30, 30),
            url: 'https://furtaev.ru/preview/man.png'
        }
    });
}

function addMarkers() {
    restaurants.forEach(function (item) {
        map.addMarker({
            lat: item.latitude,
            lng: item.longitude,
            title: item.name,
            infoWindow: {
                content: '<h4>' + item.name + '</h4><p>' + item.city + '</p>'
            },
            icon: {
                scaledSize: new google.maps.Size(30, 30),
                url: 'https://furtaev.ru/preview/eat_at_home.png'
            }
        });
    });
}
