#!/bin/bash
# Generador de nuevas llaves USB

AUTHORIZED_KEYS_DIR="../keys"
USB_UUID=$(lsblk -o UUID,TRAN | grep usb | awk '{print $1}')

mkdir -p "$AUTHORIZED_KEYS_DIR"

if [ -z "$USB_UUID" ]; then
    echo "❌ Inserta una memoria USB."
    exit 1
fi

touch "$AUTHORIZED_KEYS_DIR/$USB_UUID.key"
chmod 600 "$AUTHORIZED_KEYS_DIR/$USB_UUID.key"

echo "🔑 Llave registrada correctamente."
