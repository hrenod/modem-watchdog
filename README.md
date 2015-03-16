Requirements
============
[WebIOPi](http://sourceforge.net/projects/webiopi/files/)

Installation
============
```bash
mkdir /var/log/checker
chown -R pi /var/log/checker
```

Crontab
-------
```
*/5 * * * * cd /home/pi/checker; ./checker.sh
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
