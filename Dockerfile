FROM alpine:edge

RUN apk add git gcc musl-dev cmake make && \
    git config --global pull.rebase false && \
    git config --global user.email "adrian@travitia.xyz" && \
    git config --global user.name "Jens Reidel" && \
    git clone https://github.com/zlib-ng/zlib-ng && \
    cd zlib-ng && \
    git pull origin pull/1096/merge --no-edit && \
    cmake . -DZLIB_COMPAT=ON -DZLIB_ENABLE_TESTS=OFF -DWITH_NATIVE_INSTRUCTIONS=ON && \
    cmake --build . --config Release
