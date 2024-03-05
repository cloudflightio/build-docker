FROM alpine as oc

ADD https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz /tmp/openshift-client-linux.tar.gz
RUN tar -xvf /tmp/openshift-client-linux.tar.gz -C /tmp/ && \
    mv /tmp/oc /usr/local/bin/oc && \
    chmod +x /usr/local/bin/oc

FROM mcr.microsoft.com/azure-cli:latest

COPY --from=oc /usr/local/bin/oc /usr/local/bin/oc
RUN apk add --no-cache docker-cli bash curl kubectl
