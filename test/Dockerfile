FROM ubuntu:latest

WORKDIR /root

RUN apt update -yq && apt install -yq tmux curl wget git && cd \
    && git clone https://github.com/junegunn/fzf.git --depth 1
RUN cd /root/fzf && ./install --all
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/dmesg.* && \
    cat /dev/null > /var/log/dmesg

COPY ./harpoon /bin/harpoon
COPY ./test/driver.sh  /bin/driver

ENTRYPOINT [ "driver" ]
