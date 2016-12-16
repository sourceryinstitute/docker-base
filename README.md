:sparkles: :whale2: docker-base :ship: :sparkles:
=================================================

[![layers](https://images.microbadger.com/badges/image/sourceryinstitute/docker-base.svg)](https://hub.docker.com/r/sourceryinstitute/docker-base/)
[![commit](https://images.microbadger.com/badges/commit/sourceryinstitute/docker-base.svg)](https://hub.docker.com/r/sourceryinstitute/docker-base)
[![Docker Pulls](https://img.shields.io/docker/pulls/sourceryinstitute/docker-base.svg)](https://hub.docker.com/r/sourceryinstitute/docker-base/)
[![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)]()
[![GitHub forks](https://img.shields.io/github/forks/sourceryinstitute/docker-base.svg?style=social&label=Fork)](https://github.com/sourceryinstitute/docker-base/fork)
[![GitHub stars](https://img.shields.io/github/stars/sourceryinstitute/docker-base.svg?style=social&label=Star)](https://github.com/sourceryinstitute/docker-base)
[![GitHub stars](https://img.shields.io/github/watchers/sourceryinstitute/docker-base.svg?style=social&label=Watch)](https://github.com/sourceryinstitute/docker-base)
[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?hashtags=docker%2Cbuild%2CGCC%2CMPI&related=docker&text=Lightweight%20docker%20base%20image%20for%20building%20GCC%2C%20MPICH%20and%20OpenCoarrays%21&url=https%3A//github.com/sourceryinstitute/docker-base&via=zbeekman)

A lightweight docker image `FROM debian:testing-slim` to act as a base
image for GCC, MPICH, and OpenCoarrays builds

Use this for your own images:
-----------------------------

Your Dockerfile might look like this:

```
FROM sourceryinstitute/docker-base:latest
COPY . /context
WORKDIR /context
RUN # build your app or apt-get install, etc.
ENTRYPOINT ["/bin/bash","-c"]
CMD ["bin/bash -l"]
#etc
```

See the [Dockerfile reference] and [best practices] for further details.

Then you can build and run with something like:

```
docker build -t my-cool-image .
docker run -it --rm --name my-cool-container my-cool-image
```

Current Packages
----------------

        apt-utils
        ca-certificates
        curl
        g++
        gcc
        gfortran
        git
        libtool
        make
        openssh-client
        wget

---

[![GitHub followers](https://img.shields.io/github/followers/zbeekman.svg?style=social&label=Follow)](https://github.com/zbeekman)
[![Twitter Follow](https://img.shields.io/twitter/follow/zbeekman.svg?style=social&label=Follow)](https://twitter.com/intent/follow?screen_name=zbeekman)

[Dockerfile reference]: https://docs.docker.com/engine/reference/builder/
[best practices]: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/
