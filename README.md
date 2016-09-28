# 구성
* ubuntu:16.04
* java8
* tomcat9

# how to use
```
## build
docker build -t otwm/tomcat9 .

## run 
### container's app location : /app
### expose 8080, 8009
### container's temp location : /root/temp
docker run --name conatinerName \
    -v volumeLocation:/app \
    -p port:8080 \
    -d kdo/tomcat9
      
docker run --name conatinerName \
    -v /app \
    -p port:8080 \
    -d kdo/tomcat9        
```

# admin info
admin/admin123