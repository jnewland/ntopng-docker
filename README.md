ntopng-docker
=============

## ntopng Docker Builder

#### Install & Run
```
docker build -t ntopng-docker .
docker run --net=host -t -p 3000:3000 ntopng-docker <ntopng arguments>
```

#### Docker Compose Example

```yaml
  ntopng:
    image: ntopng-docker
    container_name: ntopng
    ports:
      - '3000:3000'
      - '5556:5556'
    expose:
      - 3000
      - 5556
    command: "--zmq-collector-mode -i tcp://0.0.0.0:5556 -m 172.16/12,192.168/16,10/8 --disable-autologout --sticky-hosts local --redis redis"
    volumes:
      - ./data/ntopng:/var/tmp/ntopng
    links:
      - redis:redis

  redis:
    container_name: redis
    image: redis
    volumes:
      - ./data/redis:/var/lib/redis
    command: redis-server --appendonly yes
```
