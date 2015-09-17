#!/bin/bash
#Let the user knowa node app is starting
echo "Starting a default node app on port 8194"

#Start the app and fork it to the background

forever start /vagrant/hello_node.js
# Let 'em know its up

echo "App is up and running on http://127.0.0.1:8194"
