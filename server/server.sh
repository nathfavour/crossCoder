#!/bin/bash

# Check if an argument was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <response>"
    exit 1
fi

# Set the response to the provided argument
response=$1

# Set the IP address and port
ip="0.0.0.0"
port="12345"  # Choose a port that is not commonly used

# Determine the operating system
os=$(uname)

# Start the server with different options based on the operating system
if [ "$os" = "Linux" ]; then
    while true; do
        echo -e "HTTP/1.1 200 OK\n\n $response" | nc -l -p $port -q 1 $ip
    done
elif [ "$os" = "Darwin" ]; then  # macOS
    while true; do
        echo -e "HTTP/1.1 200 OK\n\n $response" | nc -l $port
    done
else
    echo "Unsupported operating system: $os"
    exit 1
fi




























# #!/bin/bash

# # Check if an argument was provided
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 <response>"
#     exit 1
# fi

# # Set the response to the provided argument
# response=$1

# # Set the IP address and port
# ip="0.0.0.0"
# port="12345"  # Choose a port that is not commonly used

# # Start the server
# while true; do
#     echo -e "HTTP/1.1 200 OK\n\n $response" | nc -l -p $port -q 1 $ip
# done























# #!/bin/bash

# # Start a simple HTTP server on port 8000
# python3 -m http.server &

# # Get the IP address of the server
# IP=$(ip route get 1 | awk '{print $NF;exit}')

# # Broadcast a message to all devices on the network
# echo "http://$IP:8000" | socat - UDP-DATAGRAM:255.255.255.255:37020,broadcast



# #!/bin/bash

# # Start a simple HTTP server on port 8000
# python3 -m http.server &

# # Get the IP address of the server
# # Use ifconfig and awk to get the IP address on both Linux and macOS
# IP=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')

# # Broadcast a message to all devices on the network
# echo "http://$IP:8000" | socat - UDP-DATAGRAM:255.255.255.255:37020,broadcast