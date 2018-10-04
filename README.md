# Docker Image s3fs
Automatic Mount S3-Bucket in minimal Dockerimage

## Build Image

```sh
docker -D build -t anfa/oraclelinux-s3fs:latest --build-arg USERNAME=macanfa .
```

## Run Image

```sh
docker run --name oraclelinux-s3fs \
	-e ENDPOINT='http://S3-ENDPOINT' \
	-e BUCKET='S3-BUCKET' \
	-e ACCESS_KEY='S3-ACCESS_KEY' \
	-e SECRET_KEY='S3-SECRET_KEY' \
	--privileged \
	--rm \
	--cap-add SYS_ADMIN \
	--device /dev/fuse \
	-d anfa/oraclelinux-s3fs:latest
```
