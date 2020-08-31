# archdeskpod

simple systemd initialized podman container that runs arch with icewm window manager where you can vnc into. The containers work with rootless podman.

(dont let the name archdeskpod fool you - it is not using podman pods. I just liked that name that way)

![Login](https://github.com/saschalippert/archdeskpod/blob/master/login.png)
![VNC](https://github.com/saschalippert/archdeskpod/blob/master/vncviewer.png)

- This image is not not production ready. Use at own risk
- I am running arch on the host. Instructions will vary for other distros
- Installation
    - Configure rootless podman
        - https://www.redhat.com/sysadmin/rootless-podman-makes-sense
    - Enable cgroups v2
        - https://wiki.archlinux.org/index.php/cgroups#Switching_to_cgroups_v2
    - Also check install.sh for steps needed
- Use build.sh to build the image
- Use run.sh to run the container
    - Root will be logged in automatically
    - For vnc run the following
        - In container root console (hit enter once)
            - export DISPLAY=:0
            - x11vnc
        - On host
            - use eg vncviewer and connect to 127.0.0.1:5900
    - Stopping the container from inside
        - shutdown -h now 
