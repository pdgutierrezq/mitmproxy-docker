#!/bin/bash

# Define the path to the environment files
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DEFAULT_ENV="$SCRIPT_DIR/.env"

# Function to validate env file exists
validate_env_file() {
    if [ ! -f "$1" ]; then
        echo "Error: Environment file $1 not found."
        exit 1
    fi
}

# Function to load variables from .env file
load_env_vars() {
    local env_file=$1

    echo "Loading environment variables from $env_file..."

    # Store current ENVIRONMENT value
    local current_env=$ENVIRONMENT

    # Load .env file
    set -a
    source "$env_file"
    set +a

    # Restore ENVIRONMENT if it was set before
    if [ -n "$current_env" ]; then
        ENVIRONMENT=$current_env
    fi

    echo -e "\nEnvironment variables loaded:"
    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ $line && ! $line =~ ^# ]]; then
            key=$(echo "$line" | cut -d '=' -f1)
            echo "$key = ${!key}"
        fi
    done < "$env_file"
}

# Main execution
validate_env_file "$DEFAULT_ENV"
load_env_vars "$DEFAULT_ENV"