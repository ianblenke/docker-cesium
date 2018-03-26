FROM node:9.9.0-stretch

RUN apt-get update
RUN apt-get install -y git curl unzip

ARG CESIUM_VERSION
ENV CESIUM_VERSION=${CESIUM_VERSION}

RUN curl -sLo /tmp/cesium.zip https://github.com/AnalyticalGraphicsInc/cesium/releases/download/${CESIUM_VERSION}/Cesium-${CESIUM_VERSION}.zip && \
    mkdir /cesium && \
    cd /cesium && \
    unzip /tmp/cesium.zip && \
    rm -f /tmp/cesium.zip

WORKDIR /cesium/

RUN npm install

ENV PORT=8080
EXPOSE ${PORT}

CMD node server.js --port ${PORT} --public

