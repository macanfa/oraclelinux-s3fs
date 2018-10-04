FROM oraclelinux:7-slim
ARG USERNAME=$USERNAME

RUN yum install -y sudo

RUN useradd ${USERNAME}
RUN echo -e "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY s3fs/s3fs /usr/local/bin/s3fs
COPY s3fs/s3fs.1 /usr/local/share/man/man1/s3fs.1
COPY s3fs/libfuse.so.2.9.4 /lib64/libfuse.so.2.9.4
COPY s3fs/libnuma.so.1 /lib64/libnuma.so.1
RUN ln -sf /lib64/libfuse.so.2.9.4 /lib64/libfuse.so.2

USER ${USERNAME}
WORKDIR /home/${USERNAME}

ADD bin/ /home/${USERNAME}/bin/

ENV USER=${USERNAME}
ENV HOME=/home/${USERNAME}
ENV TERM=xterm-color
ENV TZ=Europe/Vienna
ENV LANG=en_US.UTF-8
ENV ENDPOINT=none
ENV ACCESS_KEY=none
ENV SECRET_KEY=none
ENV BUCKET=none

CMD ~/bin/run.sh
