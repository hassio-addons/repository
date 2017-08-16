FROM %%BASE_IMAGE%%
MAINTAINER Franck Nijhof <frenck@geekchimp.com>

# Add env
ENV LANG="C.UTF-8" \
    TERM="xterm-256color"

# Copy data
COPY files/run.sh /
COPY files/hassio /usr/bin/
COPY files/sshd_config /etc/ssh/
COPY files/motd /etc/
COPY files/.zshrc /root/
COPY files/.tmux.conf /root/
COPY files/wheel /etc/sudoers.d/

# Setup base
RUN apk add --no-cache jq openssh sudo zsh openssl libxml2-utils ncurses \
    curl wget net-tools bind-tools rsync git nmap wget awake \
    nano vim mosquitto-clients mariadb-client tmux && \
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    chmod a+x /run.sh /usr/bin/hassio && \
    sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd && \
    touch /etc/ssh/authorized_keys && \
    chmod 0644 /etc/ssh/authorized_keys && \
    touch /var/log/btmp && \
    chmod 0600 /var/log/btmp

CMD [ "/run.sh" ]
