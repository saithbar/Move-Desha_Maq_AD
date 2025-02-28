 #*******Begin Comment**************
.SYNOPSIS
#	This script performs the  uninstallation of an application(s).
#  Script for Move And Disable Maquine desde un TXT
# version V01
# Autor: Saith Barreto
# Fecha: Septiembre 2024
#*******End Comment**************# Ruta con las cuentas de equipo a deshabilitar
$Computers = "C:\Users\USER\Script\Maquinas_inactivas.txt"
 
# Nombre de la OU donde se moverán las máquinas
$OU_Destino = "ou=Deshabiitados,DC=nombreOU,DC=local"

# Importar módulo de Powershell para Active Directory
Import-Module ActiveDirectory

# Carga lista de cuentas de equipo en una variable
$ListarComputers = Get-Content $Computers

# Deshabilita las cuentas de equipo (Comentario)
$fecha = get-date -Format "d"
$date = $fecha + "  fecha que fue Deshabilitado "
$ListarComputers | Set-ADComputer -Description $date 
$ListarComputers | Get-ADComputer | Disable-ADAccount 

# Mueve las cuentas de equipo deshabilitadas a la OU de destino
$ListarComputers | Get-ADComputer | Move-ADObject -TargetPath "ou=Estaciones,ou=Deshabiitados,DC=nombreOU,DC=local" 
