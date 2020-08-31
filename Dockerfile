FROM archlinux:latest

RUN echo 'root:root' | chpasswd

RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN pacman -Syyu --noconfirm

RUN pacman -S --noconfirm sudo git base-devel nano net-tools curl python python-pip

RUN pacman -S --noconfirm xorg xorg-xinit xf86-video-dummy x11vnc xterm icewm xdotool imagemagick systemd-sysvcompat

COPY getty_override.conf /etc/systemd/system/console-getty.service.d/override.conf
COPY logind_override.conf /etc/systemd/system/systemd-logind.service.d/override.conf

COPY Xwrapper.config /etc/X11/Xwrapper.config
COPY xorg.conf /etc/X11/xorg.conf
COPY .xinitrc /root/.xinitrc
COPY .bash_profile /root/.bash_profile

EXPOSE 5900

STOPSIGNAL SIGRTMIN+3

CMD [ "/usr/sbin/init" ]
