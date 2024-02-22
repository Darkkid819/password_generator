# Password Generator Script

This is a simple script that generates a strong and secure password with customizable options for length and character sets.

## Features

- **Customizable Length**: Specify the length of the generated password.
- **Character Set Options**: Choose to include or exclude symbols, numbers, uppercase, and lowercase letters.
- **Command-line Interface**: Easy to use with command-line arguments for all options.

## Prerequisites

The script uses `openssl` for generating random data, which is commonly available on most Unix-like operating systems. Ensure `openssl` is installed and accessible in your system's PATH.

## Usage

To use the script, you can run it from the command line with various options:

`./password_generator.sh [OPTIONS]`

### Options

- `-l LENGTH` : Specify the password length. Default is 12 characters.
- `-s` : Include symbols in the password.
- `-S` : Exclude symbols from the password (default includes symbols).
- `-n` : Include numbers in the password.
- `-N` : Exclude numbers from the password (default includes numbers).
- `-u` : Include uppercase letters in the password.
- `-U` : Exclude uppercase letters from the password (default includes uppercase).
- `-h` : Display the help message and exit.

### Examples

- Generate a 16-character password with symbols and numbers: `./password_generator.sh -l 16 -s -n`
- Display the help message: `./password_generator.sh -h`

  
## Customization

The script is designed to be easily customizable. You can modify the default settings within the script to change the default behavior or add new character sets as needed.
