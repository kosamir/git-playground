## OS RELATED STUFF 

- user prefrerences for different applications for current user are located in  
    `/home/amirkos/.local/share`  

- user applications are typically placed in  
    `/usr/share/`  

- user executables are typically placed in  
    `/home/amirkos/.local/bin`  

- user services are typically placed in  
    `/home/amirkos/.config/systemd`  

- example service file `battery-notify.service` placed in `/home/amirkos/.config/systemd`  


<pre>
        [Unit]
        Description=Battery level notifier
        After=graphical-session.target
        
        [Service]
        Type=oneshot
        ExecStart=/home/amirkos/.local/bin/notify-battery.sh  
</pre>

- timer service  


<pre>
    [Unit]  
    Description=Run battery check every minute

    [Timer]
    OnBootSec=1min
    OnUnitActiveSec=1min
    Persistent=true

    [Install]
    WantedBy=timers.target
</pre>

- reloading deamons  

<pre>
    systemctl --user daemon-reexec
    systemctl --user daemon-reload
    systemctl --user enable --now notify-battery.service
</pre>

- (re)starting a service  
    `systemctl --user (re)start notify-battery.service`  

- loging/debugging  
    `journalctl --user-unit=notify-battery.service`
