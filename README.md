# 구성
* ubuntu:16.04
* java8
* tomcat9

# how to use
```
## build
docker build -t kdo/tomcat9 .

## run 
docker run --name conatinerName \
    -v volumeLocation:/opt \
    -p port:8080 \
    -d kdo/tomcat9  
```