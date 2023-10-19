#!/bin/bash

gcc -o server server.c -lfcgi
spawn-fcgi -p 8080 ./server
nginx -g "daemon off;" # Запуск в данном режиме нужен для тогоЮ чтобы докер на считал сразу
#что завершил работы сразу после старта 
