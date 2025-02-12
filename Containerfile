ARG BAZZITE_TAG
FROM ghcr.io/ublue-os/bazzite:${BAZZITE_TAG}

ARG AKMODSEXTRA_TAG
COPY --from=ghcr.io/ublue-os/akmods-extra:${AKMODSEXTRA_TAG} /rpms/ /tmp/rpms
RUN find /tmp/rpms

# add the ublue copr
RUN curl -L https://copr.fedorainfracloud.org/coprs/ublue-os/akmods/repo/fedora-41/ublue-os-akmods-fedora-41.repo \
         -o /etc/yum.repos.d/ublue-os-akmods-fedora-41.repo

RUN rpm-ostree install /tmp/rpms/kmods/*nct6687*.rpm
    
