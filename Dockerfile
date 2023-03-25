FROM ruby:3.0.5
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update
RUN apt-get install -y nodejs yarn
RUN wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN apt-get install -y postgresql-client-13
RUN apt-get install -y w3m
RUN apt-get install -y bc
RUN apt-get install -y default-jdk
RUN apt-get install -y default-jre
RUN apt-get install -y iproute2
RUN apt-get update && \
  apt-get install -qq -y --no-install-recommends cron && \
  rm -rf /var/lib/apt/lists/*
# Changes localtime to Singapore
RUN cp /usr/share/zoneinfo/Asia/Singapore /etc/localtime
RUN mkdir /store
WORKDIR /store
COPY Gemfile /store/Gemfile
COPY Gemfile.lock /store/Gemfile.lock
RUN bundle install
ADD . /store
CMD bash -c "rm -f tmp/pids/server.pid && rails s -p 3000 -b '0.0.0.0'"
