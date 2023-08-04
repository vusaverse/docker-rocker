#!/bin/bash

# Function that will get executed when the user presses Ctrl+C
handler() {
    echo "Processing the Ctrl+C"
    docker system prune -a
    exit 0
}

# Assign the handler function to the SIGINT signal
trap handler INT

docker build -t custom-rocker-example .

open http://localhost:8787

docker run -e PASSWORD="$1" -p 8787:8787 \
    -v "$(pwd)":/home/rstudio/output \
    -v /home/USERNAME/Documents:/home/rstudio/Documents \
    --rm custom-rocker-example

