# open_url.py
import sys
import webbrowser

# Get the URL from the command line arguments
url = sys.argv[1]

# Open the URL in the default web browser
webbrowser.open(url)