#!/bin/bash
# Bloquea el sistema cuando se retira la USB

AUTHORIZED_KEYS_DIR="/usb-lock-system/contraseñas"
 USB_DEVICE="sdb1"

 echo " Monitor de llave USB activo..."

 while true; do
 USB_UUID=$(lsblk -nr -o NAME,UUID | awk -v dev="$USB_DEVICE" '$1==dev{print $2}')

     if [ -z "$USB_UUID" ]; then
          echo "🔒 Llave USB retirada. Bloqueando sistema..."
          betterlockscreen -l
          sleep 10
          continue
      fi

      if [ ! -f "$AUTHORIZED_KEYS_DIR/$USB_UUID.key" ]; then
          echo "🚫 USB no autorizada detectada. Bloqueando sistema..."
          betterlockscreen -l
      fi

      sleep 5
  done

