#!/bin/bash

# Listen for broadcast messages
MESSAGE=$(socat - UDP4-RECVFROM:37020,ip-add-membership=224.0.0.1:0.0.0.0)

# Open a web browser to the address and port received in the message
xdg-open $MESSAGE