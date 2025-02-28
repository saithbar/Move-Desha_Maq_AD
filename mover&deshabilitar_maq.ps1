# Ruta con las cuentas de equipo a deshabilitar
$Computers = "C:\Users\ESGETDWINDOMADM02\Documents\Saith\Script\Maquinas_inactivas.txt"
 
# Nombre de la OU donde se moverán las máquinas
$OU_Destino = "ou=Deshabiitados,DC=ags-spain,DC=local"

# Importar módulo de Powershell para Active Directory
Import-Module ActiveDirectory

# Carga lista de cuentas de equipo en una variable
$ListarComputers = Get-Content $Computers

# Deshabilita las cuentas de equipo
$fecha = get-date -Format "d"
$date = $fecha + "  fecha que fue Deshabilitado "
$ListarComputers | Set-ADComputer -Description $date 
$ListarComputers | Get-ADComputer | Disable-ADAccount 

# Mueve las cuentas de equipo deshabilitadas a la OU de destino
$ListarComputers | Get-ADComputer | Move-ADObject -TargetPath "ou=Estaciones,ou=Deshabiitados,DC=ags-spain,DC=local" 