# Sistema de Autenticación por Llave USB en Linux

### USB Lock System es un proyecto de seguridad que utiliza una memoria USB como llave física para controlar el acceso a un sistema Linux.
Funciona como un segundo factor de autenticación, permitiendo o bloqueando el acceso dependiendo de la presencia de una USB autorizada

------------------------------------------------------------------------------------

# Objetivo

-Restringir el acceso al sistema si no está presente una memoria USB autorizada.
-Asociar cada USB con una llave única mediante su UUID.
-Permitir la revocación de acceso eliminando la llave correspondiente.

-------------------------------------------------------------------------------------

# Estructura del Proyecto

usb-lock-system/
│
├── Src/
│   ├── key_generator.sh      # Genera llaves de autorización
│   ├── usb_lock.sh           # Verifica la validez de la USB
│   └── lock_service.sh       # Monitor de conexión USB 
│
├── contraseñas/              # Almacén de llaves autorizadas
│   └── <UUID>.key
│
└── README.md

-------------------------------------------------------------------------------------

# Funcionamiento General

## Registro de una USB(llave/key)
-sudo ./Src/key_generator.sh 
Esto detecta la memoria USB conectada y crea una llave de autorización
-contraseñas/<UUID>.key

## Verificación de Acceso
 -./Src/usb_lock.sh

 | Estado de la USB          | Resultado        |
| ------------------------- | ---------------- |
| USB presente y autorizada | Acceso permitido |
| USB presente sin llave    | Acceso denegado  |
| USB ausente               | Acceso denegado  |

## Monitoreo de Retiro de USB
 -./Src/lock_service.sh
 
Bloquea la sesión si la USB autorizada es retirada.

-------------------------------------------------------------------------------------

## Seguridad implementada

-Las llaves están ligadas al UUID físico de cada memoria.
-El acceso se puede revocar eliminando el archivo .key.
-Compatible con integración PAM para autenticación de inicio de sesión.










