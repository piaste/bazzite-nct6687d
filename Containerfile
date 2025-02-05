FROM ghcr.io/ublue-os/bazzite:stable

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY --from=ghcr.io/ublue-os/akmods-extra:bazzite-41 /rpms/ /tmp/rpms
RUN find /tmp/rpms

# add the ublue copr
RUN curl -L https://copr.fedorainfracloud.org/coprs/ublue-os/akmods/repo/fedora-41/ublue-os-akmods-fedora-41.repo \
         -o /etc/yum.repos.d/ublue-os-akmods-fedora-41.repo

RUN rpm-ostree install /tmp/rpms/kmods/*nct6687*.rpm
    
