FROM ubuntu:16.04

# -+------------------------------------+-
# INSTALL ELIXIR
# -+------------------------------------+-
ENV LANG=C.UTF-8

RUN \
  apt update && \
  apt install -y wget curl && \
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
  dpkg -i erlang-solutions_1.0_all.deb && \
  apt update && \
  apt install -y esl-erlang elixir && \
  apt install -y erlang-src erlang-dev erlang-parsetools erlang-crypto && \
  apt install -y build-essential

# -+------------------------------------+-
# INSTALL NODE.JS
# -+------------------------------------+-

# install lts node version
RUN \
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get update && \
  apt-get install -yqq nodejs

RUN \
  apt autoclean && \
  apt autoremove -y

# -+------------------------------------+-
# SETUP
# -+------------------------------------+-

RUN \
  mkdir -p /opt/app && \
  chmod -R 777 /opt/app

WORKDIR /opt/app

CMD ["/bin/bash"]

