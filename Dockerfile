# busybox stage (because we need chmod)
FROM busybox:stable

ADD https://github.com/muttleyxd/clang-tools-static-binaries/releases/download/master-f3a37dd2/clang-format-13_linux-amd64 /clang-format
RUN chmod +x /clang-format

# then we go on scratch for minimum size
FROM scratch

LABEL \
    org.opencontainers.image.authors="Angelo Puglisi" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/deepskyblue86/clang-tools-static-docker"

COPY --from=0 /clang-format /clang-format

ENTRYPOINT [ "/clang-format" ]
