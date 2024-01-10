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
