FROM ubuntu

COPY --chown=nobody:users startup.sh /etc/trash/startup.sh

RUN chmod -R 770 /etc/trash

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y zip \
  && rm -rf /var/lib/apt/lists/*

RUN cd /etc/trash \
  && wget -O trash.zip https://github.com/rcdailey/recyclarr/releases/latest/download/recyclarr-linux-x64.zip && unzip -o trash.zip && rm trash.zip && chmod u+rx trash

RUN mkdir /etc/trash/config

ENTRYPOINT [ "/etc/trash/startup.sh" ]
