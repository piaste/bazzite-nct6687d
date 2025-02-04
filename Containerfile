FROM ghcr.io/ublue-os/bazzite:stable

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY --from=ghcr.io/ublue-os/akmods-extra:bazzite-41 /rpms/ /tmp/rpms
RUN find /tmp/rpms
RUN rpm-ostree install /tmp/rpms/kmods/*nct6687*.rpm
    
