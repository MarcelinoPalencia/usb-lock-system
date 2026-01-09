#!/bin/bash
# Sistema de bloqueo mediante llave USB
# Fase de Desarrollo — Enero


AUTHORIZED_KEYS_DIR="/usb-lock-system/contraseñas"
USB_DEVICE="sdb1"

echo "🔐 Verificando llave USB..."

USB_UUID=$(lsblk -nr -o NAME,UUID | awk -v dev="$USB_DEVICE" '$1==dev {print $2}')

if [ -z "$USB_UUID" ]; then
    echo "❌ No se detectó una memoria USB válida."
    exit 1
fi

if [ ! -f "$AUTHORIZED_KEYS_DIR/$USB_UUID.key" ]; then
    echo "❌ Llave USB no autorizada."
    exit 1
fi

echo "✅ Llave válida. Acceso permitido."
exit 0

