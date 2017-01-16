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
        marker.setPosition(latLng);
    },

    create: function (data) {
        console.log(data.latitude, data.longitude, data.user_id);
        return this.perform('update_position', data);
    }
});