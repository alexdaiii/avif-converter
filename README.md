# AVIF Docker Converter

Runs [avifenc](https://github.com/AOMediaCodec/libavif/blob/main/doc/avifenc.1.md).

## Usage

Example usage:

```shell
docker run \
--rm -v $(pwd):/home/abc ghcr.io/alexdaiii/avif-converter:latest \
input.png output.avif
```

## To Build

Name the image to whatever you want.

```shell
docker buildx build \
--platform linux/amd64,linux/arm64 \
-t ghcr.io/alexdaiii/avif-converter:latest \
--load \
.
```

This image automatically builds for both `linux/amd64` and `linux/arm64`
about twice a month.
