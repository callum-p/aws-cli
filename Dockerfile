ARG AWS_CLI_VERSION="1.16.166"

FROM alpine:3.6
ARG AWS_CLI_VERSION
RUN apk -v --update add \
        python \
        py-pip \
        && \
    pip install --upgrade awscli==$AWS_CLI_VERSION && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
