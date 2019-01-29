param ([string]$ip, [string]$destination, [string]$username)

# .\deploy-rasbian.ps1 -ip 192.168.1.90 -destination "/home/pi/test/GpioWebApi" -username pi

& ".\publish-rasbian.ps1"

& pscp.exe -r .\bin\Debug\netcoreapp2.0\linux-arm\publish\* ${username}@${ip}:${destination}

& plink.exe -v -ssh ${username}@${ip} chmod u+x,o+x ${destination}/GpioSwitcherWebApi