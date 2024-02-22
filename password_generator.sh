#!/bin/bash

# Default settings
LENGTH=12
INCLUDE_SYMBOLS=0
INCLUDE_NUMBERS=1
INCLUDE_UPPERCASE=1
INCLUDE_LOWERCASE=1

function usage {
    echo "Usage: $0 [-l LENGTH] [-s] [-S] [-n] [-N] [-u] [-U] [-h]"
    echo "  -l LENGTH    Specify the password length."
    echo "  -s          Include symbols in the password."
    echo "  -S          Exclude symbols from the password."
    echo "  -n          Include numbers in the password."
    echo "  -N          Exclude numbers from the password."
    echo "  -u          Include uppercase letters in the password."
    echo "  -U          Exclude uppercase letters from the password."
    echo "  -h          Display this help message."
    exit 1
}

while getopts ":l:sSnNuUh" opt; do
    case ${opt} in
        l ) LENGTH=$OPTARG ;;
        s ) INCLUDE_SYMBOLS=1 ;;
        S ) INCLUDE_SYMBOLS=0 ;;
        n ) INCLUDE_NUMBERS=1 ;;
        N ) INCLUDE_NUMBERS=0 ;;
        u ) INCLUDE_UPPERCASE=1 ;;
        U ) INCLUDE_UPPERCASE=0 ;;
        h ) usage ;;
        \? ) echo "Invalid Option: -$OPTARG" 1>&2; usage ;;
        : ) echo "Invalid Option: -$OPTARG requires an argument" 1>&2; usage ;;
    esac
done

SYMBOLS='!@#$%^&*()-_=+[]{};:,.<>?'
NUMBERS='0123456789'
UPPERCASE='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
LOWERCASE='abcdefghijklmnopqrstuvwxyz'

CHARS=""
[[ $INCLUDE_SYMBOLS -eq 1 ]] && CHARS="$CHARS$SYMBOLS"
[[ $INCLUDE_NUMBERS -eq 1 ]] && CHARS="$CHARS$NUMBERS"
[[ $INCLUDE_UPPERCASE -eq 1 ]] && CHARS="$CHARS$UPPERCASE"
[[ $INCLUDE_LOWERCASE -eq 1 ]] && CHARS="$CHARS$LOWERCASE"

if [[ -z $CHARS ]]; then
    echo "Error: At least one character set (symbols, numbers, uppercase, lowercase) must be included." >&2
    exit 1
fi

PASSWORD=$(openssl rand -base64 48 | tr -dc "$CHARS" | head -c $LENGTH)

echo "Generated Password: $PASSWORD"
