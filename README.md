# libresonic
Libresonic Docker-Image

# Usage
```
docker run \
    -d \
    --name libresonic \
    -p 8080:8080 \
    -v /path/to/media:/media \
    -v /path/to/persist/config:/config \
    jkuettner/libresonic
```