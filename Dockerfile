FROM elixir:1.9

# create workdir
RUN \
  mkdir -p /opt/app && \
  chmod -R 777 /opt/app

# install node dependencies
RUN \
  apt-get update && \
  apt-get install -yqq apt-transport-https

# install lts node version
RUN \
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get update && \
  apt-get install -yqq nodejs yarn

# refresh hex and rebar on build
ONBUILD RUN mix do local.hex --force, local.rebar --force

WORKDIR /opt/app

CMD ["/bin/sh"]
