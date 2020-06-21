
```shell
$ docker build -t wpe .

$ docker run --group-add video --device=/dev/dri -e XDG_RUNTIME_DIR=/tmp \
  -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
  wpe cog -P fdo https://igalia.com
```
