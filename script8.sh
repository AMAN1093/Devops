#!/bin/bash
read -sp "Enter your password: " password
echo

if [[ ${#password} -lt 8 ]]; then
    echo " Password must be at least 8 characters long."
    exit 1
fi

if ! [[ $password =~ [0-9] ]]; then
    echo " Password must contain at least one number."
    exit 1
fi

if ! [[ $password =~ [\@\#\$\%\^\&\*\!\~\.\,\_\-] ]]; then
    echo " Password must contain at least one special character (@ # $ % ^ & * etc.)."
    exit 1
fi

echo " Password is strong!"

