#!/bin/bash

# Read auth cookie as hex string
COOKIE=$(xxd -ps /var/run/tor/control.authcookie | tr -d '\n')

# Send NEWNYM signal to Tor ControlPort using cookie authentication
printf 'AUTHENTICATE %s\r\nSIGNAL NEWNYM\r\nQUIT\r\n' "$COOKIE" | nc 127.0.0.1 9051 > /dev/null
