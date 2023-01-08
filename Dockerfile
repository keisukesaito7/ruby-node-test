FROM ruby:2.7-slim

# apt-get remove -y curl はいらないかも
RUN apt-get update -qq \
  && apt-get -y install curl \
  && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt-get install -y nodejs \
  && apt-get remove -y curl \
  && apt-get remove --purge -y curl \
  && apt-get -y autoremove \
  && apt-get clean

WORKDIR /var/repo
COPY ./package.json /var/repo

RUN npm install
RUN npm install -g serverless

