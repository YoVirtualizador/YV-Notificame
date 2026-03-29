# YV-Notificame
Notify identity after a reboot

---
Reguiere sendmail y figlet en esta versión. Se puede cambiar por banner y openssl.  

Añade el fichero noip.service a /etc/systemd/system
Por ejemplo /etc/systemd/system/noip.service

Crea la ruta /opt/noip/ y copia noip.sh en la ruta.

Configura tu correo entrante y saliente en sendmail.  
Añade las direcciones de correo al script.   

Añade permisos de ejecución.

---

La respuesta esperada debería ser algo parecido a esto:



```
__   __ __     ___      _               _ _              _              
\ \ / /_\ \   / (_)_ __| |_ _   _  __ _| (_)______ _  __| | ___  _ __   
 \ V / _ \ \ / /| | '__| __| | | |/ _` | | |_  / _` |/ _` |/ _ \| '__|  
  | | (_) \ V / | | |  | |_| |_| | (_| | | |/ / (_| | (_| | (_) | |     
  |_|\___/ \_/  |_|_|   \__|\__,_|\__,_|_|_/___\__,_|\__,_|\___/|_|     
                                                                        
-------------------Host------------------  
petete  
-------------------LAN-------------------  
end0 			 192.168.10.12/24  
ztzogrnniv 			 192.168.192.12/24  
br-554b33148c2c 			 172.18.0.1/16  
br-b3e73e44ffb6 			 172.19.0.1/16  
docker0 			 172.17.0.1/16  
default Gateway 192.168.10.1  
-------------------WAN-------------------  
192.0.2.69  
-----Último evento antes de la caída-----  
Mar 29 22:55:30 petete systemd-journald[524]: Received client request to flush runtime journal.  
-----------------------------------------  
```
