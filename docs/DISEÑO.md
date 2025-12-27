# Fase de Diseño

## Arquitectura del sistema

El sistema estará compuesto por los siguientes elementos:

### Componentes principales

- **usb_lock.sh** → Script principal 
- **keys/** → Carpeta donde se almacenan las llaves de acceso.
- **key_generator.sh** → Script para crear nuevas llaves USB.
- **lock_service.sh** → Servicio que bloquea el sistema al retirar la USB.
- **LUKS** → Mecanismo de cifrado del sistema de archivos.

### Flujo de funcionamiento

1. El sistema inicia.
2. El script verifica si existe una USB autorizada.
3. Si no existe, se bloquea el acceso al sistema.
4. Si existe, se descifra el sistema de archivos.
5. El usuario accede sin contraseña.
6. El sistema permite generar nuevas llaves USB.
7. Al retirar la USB, el sistema se bloquea automáticamente.

### Seguridad

- Las llaves USB se identifican por UUID.
- Las llaves no se copian al sistema.
- Se usan permisos restringidos para los archivos de control.
