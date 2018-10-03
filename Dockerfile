FROM oraclelinux:7-slim

COPY run.sh /

COPY s3fs/s3fs /usr/local/bin/s3fs
COPY s3fs/s3fs.1 /usr/local/share/man/man1/s3fs.1
COPY s3fs/libfuse.so.2.9.4 /lib64/libfuse.so.2.9.4
COPY s3fs/libnuma.so.1 /lib64/libnuma.so.1
RUN ln -sf /lib64/libfuse.so.2.9.4 /lib64/libfuse.so.2

CMD /run.sh
