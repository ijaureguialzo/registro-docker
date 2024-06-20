#!/bin/bash

read -r -p "Username: " USER
read -r -s -p "Password: " PASS

htpasswd -Bb /data/htpasswd "$USER" "$PASS" 2>/dev/null 1>&2

echo
echo
echo "Usuario generado: $USER"
