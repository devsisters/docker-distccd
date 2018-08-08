docker-distccd [![Docker Stats]][Docker Hub]
========
Dockerized [distccd] for easy distribution.

Usage
--------
```sh
# If you want to allow connections from 192.168.0.0/20 ...
docker run -p3632:3632 devsisters/distccd:ubuntu-16.04 192.168.0.0/20
```

Tags
--------
- `ubuntu-18.04`
- `ubuntu-18.10`
- `ubuntu-16.04`
- `ubuntu-14.04`
- `debian-9`
- `debian-8`
- `debian-7`

How to contribute
--------
```sh
# Build docker images
make -j

# Push built images
docker login
make push
```

<br>

--------
*docker-distccd* is primarily distributed under the terms of both the [MIT
license] and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[distccd]: https://cdn.rawgit.com/distcc/distcc/master/doc/web/index.html
[Docker Hub]: https://hub.docker.com/r/devsisters/distccd/
[Docker Stats]: https://badgen.net/docker/pulls/devsisters/distccd?icon=docker&label=pulls
[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
