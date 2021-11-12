FROM alpine:edge

RUN apk add git gcc musl-dev cmake make && \
    git clone https://github.com/zlib-ng/zlib-ng && \
    cd zlib-ng && \
    cmake . -DZLIB_COMPAT=ON -DZLIB_ENABLE_TESTS=OFF && \
    cmake --build . --config Release
