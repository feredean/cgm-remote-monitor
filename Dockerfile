FROM node:10.15.1

RUN mkdir -p /opt/app
ADD . /opt/app
WORKDIR /opt/app

RUN npm install && \
  npm run postinstall && \
  npm run env

EXPOSE 1337

CMD ["bash", "start.sh"]
# CMD tail -f /dev/null
