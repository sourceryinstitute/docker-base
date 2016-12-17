FROM debian:testing-slim

MAINTAINER Izaak "Zaak" Beekman <contact@izaakbeekman.com>

ENV REFRESHED_AT 2016-12-07
COPY LICENSE /NOTICE

RUN  DEBIAN_FRONTEND=noninteractive \
     && set -v \
     && echo "$DEBIAN_FRONTEND" \
     && cat /NOTICE \
     && apt-get update \
     && apt-get install --no-install-recommends --no-install-suggests -y \
        ca-certificates \
        g++ \
        gcc \
        gfortran \
        git \
        libtool \
        make \
        openssh-client \
        wget \
     && gcc --version \
     && apt-get autoremove \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/* /var/log/* /tmp/* \
     && echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/issue | echo -n && cat /etc/motd && cat /NOTICE' >> /etc/bash.bashrc \
     && printf "\
         sourceryinstitute/docker-base  Copyright (C) 2016 Sourcery Institute \n\
         This program comes with ABSOLUTELY NO WARRANTY.\n\
         This is free software, and you are welcome to redistribute it\n\
         under certain conditions.\n\
         \n\
         see https://github.com/sourceryinstitute/blob/master/LICENSE for the full BSD-3 license\n\n\n" > /etc/motd


# Build-time metadata as defined at http://label-schema.org
    ARG BUILD_DATE
    ARG VCS_REF
    ARG VCS_URL
    LABEL org.label-schema.schema-version="1.0" \
          org.label-schema.build-date="$BUILD_DATE" \
	  org.label-schema.version="1.0" \
          org.label-schema.name="docker-base" \
          org.label-schema.description="Lightweight base image for gcc, mpich and opencoarrays" \
          org.label-schema.url="https://github.com/sourceryinstitute/docker-base/" \
          org.label-schema.vcs-ref="$VCS_REF" \
          org.label-schema.vcs-url="$VCS_URL" \
          org.label-schema.vendor="Sourcery Institute" \
          org.label-schema.license="BSD-3-Clause" \
          org.label-schema.docker.cmd="docker run -v $(pwd):/workdir -i -t sourceryinstitute/docker-base:latest"

ENTRYPOINT ["/bin/bash"]

CMD ["-l"]
