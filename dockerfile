FROM debian:stretch

COPY --chown=nobody:users startup.sh /etc/trash/startup.sh

RUN mkdir /etc/trash/config

RUN chmod -R 770 /etc/trash

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y zip \
  && apt-get install -y libicu-dev \
  && apt-get install -y cron \
  && rm -rf /var/lib/apt/lists/*

RUN cd /etc/trash \
  && wget -O trash.zip https://github.com/rcdailey/recyclarr/releases/latest/download/recyclarr-linux-x64.zip && unzip -o trash.zip && rm trash.zip && chmod u+rx  recyclarr && mv recyclarr exec

RUN export XDG_CONFIG_HOME=$HOME/.config

ENTRYPOINT [ "/etc/trash/startup.sh" ]
# CMD tail -f /dev/null