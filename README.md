# internsctl - Custom Linux Command

## Description

The internsctl is a custom Linux command designed for various system operations. It provides functionalities to get CPU and memory information, manage users, and retrieve file information.

## Version

Current version: v0.1.0

## Usage

```bash
internsctl [options]
Options
cpu getinfo: Get CPU information.
memory getinfo: Get memory information.
user create <username>: Create a new user with the specified username.
user list: List all regular users.
user list --sudo-only: List users with sudo permissions.
file getinfo <file-name>: Get information about a file.
--help: Display usage information.
--version: Display the version of internsctl.
# Get CPU information
internsctl cpu getinfo

# Get memory information
internsctl memory getinfo

# Create a new user 'john'
internsctl user create john

# List all regular users
internsctl user list

# List users with sudo permissions
internsctl user list --sudo-only

# Get information about 'hello.txt'
internsctl file getinfo hello.txt --size
