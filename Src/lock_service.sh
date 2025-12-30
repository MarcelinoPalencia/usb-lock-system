#!/bin/bash
# Bloquea el sistema cuando se retira la USB

while true; do
    USB_UUID=$(lsblk -o UUID,TRAN | grep usb | awk '{print $1}')
    
    if [ -z "$USB_UUID" ]; then
        echo "🔒 USB retirada. Bloqueando sistema..."
        loginctl lock-session
    fi
    
    sleep 5
done
