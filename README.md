# AVIF Docker Converter

Runs the [avifenc](https://github.com/AOMediaCodec/libavif/blob/main/doc/avifenc.1.md) command.

## Usage

```shell
docker run --rm -v $(pwd):/home/abc ghcr.io/alexdaiii/avif-converter:latest input.png output.avif
```

## To Build

Name the image to whatever you want.

```shell
docker buildx build \
--platform linux/amd64,linux/arm64 \
-t ghcr.io/alexdaiii/avif-converter:latest \
--push .
```

This image automatically builds for both `linux/amd64` and `linux/arm64`
about twice a month.
