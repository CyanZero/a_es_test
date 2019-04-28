server {
        listen 80;
        server_name _;

        location / {
            rewrite ^/(.*) /$1 break;
            proxy_ignore_client_abort on;
            proxy_pass http://localhost:9200;
            proxy_set_header  X-Real-IP  $remote_addr;
            proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header  Host $http_host;

            auth_basic           "Nginx with basic auth.";
            auth_basic_user_file /etc/nginx/passwdfile;
        }
}