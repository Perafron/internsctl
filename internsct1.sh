#!/bin/bash

# internsctl - v0.1.0

# Function to display usage information for internsctl
function display_usage {
    echo "Usage: internsctl [options]"
    echo "Options:"
    echo "  cpu getinfo            Get CPU information."
    echo "  memory getinfo         Get memory information."
    echo "  user create <username> Create a new user with the specified username."
    echo "  user list              List all regular users."
    echo "  user list --sudo-only  List users with sudo permissions."
    echo "  file getinfo <file-name>  Get information about a file."
    echo "  --help                 Display this help message."
    echo "  --version              Display the version of internsctl."
}

# Function to display the manual page for internsctl
function display_manual {
    echo "internsctl - Custom Linux Command v0.1.0"
    echo
    echo "DESCRIPTION:"
    echo "  internsctl is a custom Linux command for various operations."
    echo
    echo "OPTIONS:"
    echo "  cpu getinfo            Get CPU information."
    echo "  memory getinfo         Get memory information."
    echo "  user create <username> Create a new user with the specified username."
    echo "  user list              List all regular users."
    echo "  user list --sudo-only  List users with sudo permissions."
    echo "  file getinfo <file-name>  Get information about a file."
    echo "  --help                 Display this help message."
    echo "  --version              Display the version of internsctl."
    echo
    echo "EXAMPLES:"
    echo "  internsctl cpu getinfo             Get CPU information."
    echo "  internsctl memory getinfo          Get memory information."
    echo "  internsctl user create john        Create a new user 'john'."
    echo "  internsctl user list               List all regular users."
    echo "  internsctl user list --sudo-only   List users with sudo permissions."
    echo "  internsctl file getinfo hello.txt  Get information about 'hello.txt'."
    echo "  internsctl --help                  Display help information."
    echo "  internsctl --version               Display the version of internsctl."
}

# Function to get CPU information
function get_cpu_info {
    lscpu
}

# Function to get memory information
function get_memory_info {
    free -h
}

# Function to create a new user
function create_user {
    if [ -z "$2" ]; then
        echo "Error: Please provide a username for the new user."
        exit 1
    fi
    echo "Creating new user: $2"
    sudo useradd -m "$2"
    sudo passwd "$2"
}

# Function to list users
function list_users {
    cut -d: -f1 /etc/passwd
}

# Function to list users with sudo permissions
function list_sudo_users {
    getent group sudo | cut -d: -f4 | tr ',' '\n'
}

# Function to display file information
function display_file_info {
    file="$1"

    if [ ! -f "$file" ]; then
        echo "Error: File '$file' does not exist."
        exit 1
    fi

    # Check for options
    case "$2" in
        --size | -s)
            stat -c "%s" "$file"
            ;;
        --permissions | -p)
            stat -c "%A" "$file"
            ;;
        --owner | -o)
            stat -c "%U" "$file"
            ;;
        --last-modified | -m)
            stat -c "%y" "$file"
            ;;
        *)
            echo "Error: Invalid option provided or no option specified."
            exit 1
            ;;
    esac
}

# Main script logic
case "$1" in
    cpu)
        case "$2" in
            getinfo)
                get_cpu_info
                ;;
            *)
                echo "Error: Unknown option for CPU. Use internsctl --help for usage information."
                exit 1
                ;;
        esac
        ;;
    memory)
        case "$2" in
            getinfo)
                get_memory_info
                ;;
            *)
                echo "Error: Unknown option for memory. Use internsctl --help for usage information."
                exit 1
                ;;
        esac
        ;;
    user)
        case "$2" in
            create)
                create_user "$@"
                ;;
            list)
                list_users
                ;;
            list|--sudo-only)
                list_sudo_users
                ;;
            *)
                echo "Error: Unknown option for user. Use internsctl --help for usage information."
                exit 1
                ;;
        esac
        ;;
    file)
        case "$2" in
            getinfo)
                display_file_info "$3" "$4"
                ;;
            *)
                echo "Error: Unknown option for file. Use internsctl --help for usage information."
                exit 1
                ;;
        esac
        ;;
    --help)
        display_usage
        ;;
    --version)
        echo "internsctl v0.1.0"
        ;;
    *)
        display_manual
        ;;
esac

exit 0