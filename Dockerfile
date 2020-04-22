FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y build-essential wget ninja-build libwayland-dev wayland-protocols libglib2.0-dev libinput-dev libgles2-mesa-dev libgbm-dev libdrm-dev git cmake libwpebackend-fdo-1.0-dev libwpewebkit-1.0-dev && \
    apt-get clean


RUN cd /tmp \
    && wget https://wpewebkit.org/releases/cog-0.6.0.tar.xz \
    && tar xf cog-0.6.0.tar.xz \
    && cd cog-0.6.0 \
    && cmake -GNinja . -DCOG_PLATFORM_FDO=ON -DCOG_PLATFORM_DRM=ON -DCMAKE_INSTALL_PREFIX=/usr \
    && ninja install

ENV XDG_RUNTIME_DIR /tmp
ENV WAYLAND_DISPLAY=$WAYLAND_DISPLAY

#CMD ["cog", "-P", "fdo", "https://igalia.com"]

