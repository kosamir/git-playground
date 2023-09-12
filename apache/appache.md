### TODO
[how to change default index in appache]( https://ubiq.co/tech-blog/how-to-change-default-index-page-in-apache/ )
<!-- ovo je samo komentar -->

As you have configured and run a Node.js demo server. Now, start configuration with the Apache web server. Create a virtual host configuration file for your domain under /etc/apache2/sites-available/ directory.

### Debian based system's 
sudo nano /etc/apache2/sites-available/example.com.conf 

### Redhat based system's 
sudo vim /etc/httpd/conf.d/example.com.conf 
Add the following content.

    <VirtualHost *:80>
    ServerName example.com
    ServerAlias www.example.com
    ServerAdmin webmaster@example.com
    
    ProxyPreserveHost On
    ProxyPass /some_path http://localhost:3000/
    ProxyPassReverse /some_path http://localhost:3000/
    
    ErrorLog /var/log/apache2/error.log
    CustomLog /var/log/apache2/access.log combined
    </VirtualHost>
