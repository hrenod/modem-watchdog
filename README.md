Installation
============
```bash
mkdir /var/log/checker
chown -R pi /var/log/checker
```

Crontab
-------
```
* * * * * /home/pi/checker/checker.sh
```

Logrotate
---------
Create a file /etc/logrotate.d/checker:
```
/var/log/checker/checker.log {
        monthly
        rotate 12
        compress
        delaycompress
        missingok
        notifempty
        create 644 pi pi
}
```
