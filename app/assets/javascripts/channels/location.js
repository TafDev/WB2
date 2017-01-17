App.location = App.cable.subscriptions.create("LocationChannel", {
    connected: function() {
        console.log("location connected")
    },
    disconnected: function() {
        console.log("location disconnected")
    },
    received: function(data) {
        console.log(data.latitude, data.longitude);
        latLng = new google.maps.LatLng(data.latitude, data.longitude);
        var marker = findMarker(data.user_id);
        if (marker) {
            marker.setPosition(latLng)
        }
        else {
            addMarker(latLng, "placeholder", data.user_id);
        }
        // marker.setPosition(latLng);
    },

    create: function (data) {
        console.log(data.latitude, data.longitude, data.user_id);
        return this.perform('update_position', data);
    }
});