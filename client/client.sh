#!/bin/bash

# Set the server IP address and port
# server_ip="0.0.0.0"
# port="12345"  # The port the server is listening on

# server_ip="192.168.1.100"  # Replace with your server's IP address
# port="12345"  # The port the server is listening on

# Ask the user for the server IP address and port
# echo "Please enter the server IP address (default: 192.168.1.100):"
# read -r -i "192.168.1.100" server_ip
# echo "Please enter the port (default: 12345):"
# read -r -i "12345" port

# Ask the user for the server IP address and port
echo "Please enter the server IP address:"
read -r server_ip
server_ip=${server_ip:-"192.168.1.151"}

echo "Please enter the port:"
read -r port
port=${port:-"12345"}

# Send a GET request to the server and save the response
response=$(curl -s "http://$server_ip:$port")
echo "$response"

# Extract the URL from the response
# This assumes the URL is the only line in the response body
url=$(echo "$response" | awk 'NR>1{print $1}')

# Determine the operating system
os=$(uname)


# # Open the URL in a web browser
# if [ "$os" = "Linux" ]; then
#     gnome-terminal -- xdg-open "$url"
# elif [ "$os" = "Darwin" ]; then  # macOS
#     osascript -e 'tell application "Terminal" to do script "open '"$url"'"'

# else
#     echo "Unsupported operating system: $os"
#     exit 1
# fi





# Open the URL in a web browser
if [ "$os" = "Linux" ]; then
    gnome-terminal -- python3 open_url.py "$url"
elif [ "$os" = "Darwin" ]; then  # macOS
    osascript -e 'tell application "Terminal" to do script "python3 open_url.py '"$url"'"'
else
    echo "Unsupported operating system: $os"
    exit 1
fi






# Open the URL in a web browser
# if [ "$os" = "Linux" ]; then
#     xdg-open "$url"
# elif [ "$os" = "Darwin" ]; then  # macOS
#     open "$url"
# else
#     echo "Unsupported operating system: $os"
#     exit 1
# fi































# #!/bin/bash

# # Start a simple HTTP server on port 8000
# python3 -m http.server &

# # Determine the operating system
# os=$(uname)

# # Get the IP address of the server
# if [ "$os" = "Linux" ]; then
#     IP=$(ip route get 1 | awk '{print $NF;exit}')
# elif [ "$os" = "Darwin" ]; then  # macOS
#     IP=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')
# else
#     echo "Unsupported operating system: $os"
#     exit 1
# fi

# # Broadcast a message to all devices on the network
# echo "http://$IP:8000" | socat - UDP-DATAGRAM:255.255.255.255:37020,broadcast










































# #!/bin/bash

# # Start a simple HTTP server on port 8000
# python3 -m http.server &

# # Get the IP address of the server
# IP=$(ip route get 1 | awk '{print $NF;exit}')

# # Broadcast a message to all devices on the network
# echo "http://$IP:8000" | socat - UDP-DATAGRAM:255.255.255.255:37020,broadcast