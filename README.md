ntopng-docker
=============

## ntopng Docker Builder

#### Install & Run
```
docker build -t ntopng-docker .
docker run --net=host -t -p 3000:3000 ntopng-docker <ntopng arguments>
```
