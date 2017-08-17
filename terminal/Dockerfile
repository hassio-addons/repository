FROM %%BASE_IMAGE%%
MAINTAINER Franck Nijhof <frenck@geekchimp.com>

# Add env
ENV LANG="C.UTF-8" \
    TERM="xterm-256color"

# Copy data
COPY files/run.sh /
COPY files/hassio /usr/bin/
COPY files/motd /etc/
COPY files/.zshrc /root/
COPY files/.tmux.conf /root/

# Setup base
RUN apk add --no-cache jq openssh-client sudo zsh openssl libxml2-utils \
    ncurses curl wget net-tools bind-tools rsync git nmap wget awake \
    nano vim mosquitto-clients mariadb-client tmux ttyd && \
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    chmod a+x /run.sh /usr/bin/hassio
CMD [ "/run.sh" ]
