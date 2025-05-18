# Reverse Proxy and Nginx

>Problem: Our app is currently accessible through an ugly URL that includes a port number, like: `http://ec2-65-2-166-150.ap-south-1.compute.amazonaws.com:8080/todos`. We want to hide the port number to make the URL look cleaner. The first idea might be to run the app on port 80, which is the default for HTTP. However, ports like 80 are often already in use or reserved by the system. Even if you manage to run your app on port 80, you can't run multiple apps on the same port. 

> The solution is to run Nginx on port 80 and use it as a reverse proxy. This way, Nginx handles the incoming requests and forwards them to the correct application running on different ports (like 8080, 8081, etc.), while users only see the clean domain in the browser.

**Reverse Proxy: Incoming request comes to the server based on the url it will be directed**

## Steps for nginx :

1. ```bash
   sudo apt update
   sudo apt install ngnix
   ```

> This should start a `nginx server` at port 80

2. Open a `Security Group` TCP on `AWS` for port 80 or select HTTP in `SG`

> Now you can direct two different domains on this nginx to test , you can buy domains from `domains.squarespace.com`.

> You will see that nginx is running successfully but futher configurations are required.

3. Open the configuration file for nginx which is present here `/etc/nginx/nginx.conf`

- You can open it by running `sudo vi /etc/nginx/nginx.conf`

4. Write this in
   ```bash
   events {
    # Event directives...
   }
   
   http {
        server {
        listen 80;
        server_name your_app1.domain_name.com;

            location / {
                proxy_pass http://localhost:8080;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
            }
        }

        server {
        listen 80;
        server_name your_app2.domain_name.com;

            location / {
                proxy_pass http://localhost:8081;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
            }
        }       
    }    
    sudo nginx -s reload
    ```

5. Run this `sudo nginx -s reload` to reload nginx
>Now if you to you app_url you will see your application 