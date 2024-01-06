
#!/bin/bash

# Start a simple HTTP server on port 8000
python3 -m http.server &

# Get the IP address of the server
IP=$(ip route get 1 | awk '{print $NF;exit}')

# Broadcast a message to all devices on the network
echo "http://$IP:8000" | socat - UDP-DATAGRAM:255.255.255.255:37020,broadcast