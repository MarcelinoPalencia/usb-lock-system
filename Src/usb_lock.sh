#!/bin/bash
# Sistema de bloqueo mediante llave USB
# Fase de Desarrollo — Enero

AUTHORIZED_KEYS_DIR="../keys"

echo "🔐 Verificando llave USB..."

USB_UUID=$(lsblk -o UUID,TRAN | grep usb | awk '{print $1}')

if [ -z "$USB_UUID" ]; then
    echo "❌ No se detectó llave USB. Sistema bloqueado."
    exit 1
fi

if [ ! -f "$AUTHORIZED_KEYS_DIR/$USB_UUID.key" ]; then
    echo "❌ Llave USB no autorizada."
    exit 1
fi

echo "✅ Llave válida. Acceso permitido."
