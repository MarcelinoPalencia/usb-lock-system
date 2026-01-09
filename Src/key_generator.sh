#!/bin/bash
# Generador de nuevas llaves USB

AUTHORIZED_KEYS_DIR="/usb-lock-system/contraseñas"

if [ "$EUID" -ne 0 ]; then
    echo "❌ Ejecuta como root."
    exit 1
fi

USB_UUID=$(lsblk -nr -o NAME,UUID | awk '$1 ~ /^sd[b-z][0-9]+$/ {print $2; exit}')

if [ -z "$USB_UUID" ]; then
    echo "❌ Inserta una memoria USB."
    exit 1
fi

mkdir -p "$AUTHORIZED_KEYS_DIR"

touch "$AUTHORIZED_KEYS_DIR/$USB_UUID.key"
chmod 600 "$AUTHORIZED_KEYS_DIR/$USB_UUID.key"

echo "🔑 Llave registrada correctamente:"
echo "   $AUTHORIZED_KEYS_DIR/$USB_UUID.key"
