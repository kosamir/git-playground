### POPOS    
- `Ctrl+Alt+F1` - enter tty    
    
### Ako se GRAFULJA zajebe    
`Ctrl + Alt + F3` - tty    
`sudo rm /etc/X11/xorg.conf`    
`sudo systemctl restart display-manager.service`    
    
### Install something as linux service    
    
Turning it into a service    
Let’s create a file called /etc/systemd/system/rot13.service:    
`    
[Unit]    
Description=ROT13 demo service    
After=network.target    
StartLimitIntervalSec=0    
[Service]    
Type=simple    
Restart=always    
RestartSec=1    
User=centos  
ExecStart=/usr/bin/env php /path/to/server.php  
  
[Install]  
WantedBy=multi-user.target  
`  
You’ll need to:  
- set your actual username after User=  
- set the proper path to your script in ExecStart=  
That’s it. We can now start the service:  
 `systemctl start rot13`  
And automatically get it to start on boot:  
`systemctl enable rot13`  
  
`.config/autostart/` - tu se nalaze skripte koje se pokrecu prilikom startup-a:  
Call powertop auto-tune automatically at boot time  
1. On systems using systemd as startup manager (like Ubuntu) install it as a service:  
```  
cat << EOF | sudo tee /etc/systemd/system/jackd.service  
[Unit]  
Description=PowerTOP auto tune  
  
[Service]  
Type=idle  
Environment="TERM=dunomb"  
ExecStart=jack_control start  
  
[Install]  
WantedBy=multi-user.target  
EOF  
```  
`systemctl daemon-reload`  
`systemctl enable powertop.service`  
  
### PopOs switch graphics  
https://support.system76.com/articles/graphics-switch-pop  
  
### GRAFULJA KONFIGURACIJA MONITORA  
  
hdpi deamon - OFF  
  
spremi konfiguraciju o obican text file  npr /home/amirkos/20-nvidia.conf  
opali   
 sudo cp /home/amirkos/20-nvidia.conf /etc/X11/Xsession.d/20-nvidia.conf  
  
restart!!!! settings monitora od zadnjeg reboota bi trebali biti sejvani..  
znaci rezlolucija, pozicija itd..  
vise u video fajlu ispod:  
  
https://ubuntuforums.org/showthread.php?t=2383538  
  
https://www.youtube.com/watch?v=Hsa0ebZKfys  
https://support.system76.com/articles/hidpi-multi-monitor/  
  
https://support.system76.com/articles/login-loop-pop/  
