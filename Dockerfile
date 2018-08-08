ARG distro
ARG version

FROM ${distro}:${version}

# Install distcc
RUN apt-get update && apt-get install -y g++ clang distcc

# Create a new user named 'user'
RUN useradd --create-home --shell /bin/sh user
USER user

EXPOSE 3632
ENTRYPOINT ["distccd", "--daemon", "--no-detach", "--log-stderr", "--log-level=debug", "--allow"]
