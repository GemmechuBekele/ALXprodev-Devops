#!/bin/bash

# URL for Pikachu data from the Pokémon API
URL="https://pokeapi.co/api/v2/pokemon/pikachu"

# Make the API request and save response
response=$(curl -s -w "%{http_code}" -o data.json "$URL")

# Extract HTTP status code from response
http_code="${response: -3}"

# Check if request was successful (status code 200)
if [ "$http_code" -eq 200 ]; then
    echo "Successfully retrieved data for Pikachu."
else
    echo "$(date): Failed to retrieve data from $URL - HTTP status $http_code" >> errors.txt
    # Remove potentially incomplete data.json file
    rm -f data.json
fi
