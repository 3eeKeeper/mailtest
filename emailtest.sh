#!/bin/bash

# SMTP server details
SERVER="server"
PORT="25"
SENDER="email"
RECIPIENT="email"

# Perform the entire email transaction within a single TLS session
(
echo "EHLO parrot"
sleep 1
echo "STARTTLS"
sleep 2
echo "EHLO parrot"
sleep 1
echo "MAIL FROM:<$SENDER>"
echo "RCPT TO:<$RECIPIENT>"
echo "DATA"
echo "Subject: Test Email"
echo ""
echo "This is a test email."
echo "."
echo "QUIT"
) | openssl s_client -connect $SERVER:$PORT -starttls smtp -crlf -ign_eof
