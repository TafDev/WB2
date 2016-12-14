App.messaging = App.cable.subscriptions.create("MessagingChannel", {
    connected: function() {
        console.log("connected")
    },
    disconnected: function() {
        console.log("disconnected")
    },
    received: function(data) {
        console.log(data);
       $('.segment').append(
           '<div class="ui icon message">' +
            data.name + ": " + data.body +
           '</div>'
       )
    }
});


