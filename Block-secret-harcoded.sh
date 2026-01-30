#!/bin/bash

echo " ☠ Running pre-commit Hook"

if git diff --cached | grep -i "secret" ; then
    echo "There's a secret in the code, commit blocked!"
    exit 1
fi

echo "✔ No secrets found, commit allowed."
exit 0