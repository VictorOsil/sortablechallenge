# FROM node:10.15.3
# RUN mkdir -p /app/node_modules && chown -R node:node /app
# WORKDIR /app
# # COPY package*.json ./
# RUN npm install -g parcel
# RUN npm install
# COPY . .
# # EXPOSE 3000
# CMD ["npm", "start"]


FROM ruby:2.5.3
# RUN git clone git://github.com/rbenv/rbenv.git /usr/local/rbenv \
# &&  git clone git://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build \
# &&  git clone git://github.com/jf/rbenv-gemset.git /usr/local/rbenv/plugins/rbenv-gemset \
# &&  /usr/local/rbenv/plugins/ruby-build/install.sh
# ENV PATH /usr/local/rbenv/bin:$PATH
# ENV RBENV_ROOT /usr/local/rbenv

# RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh \
# &&  echo 'export PATH=/usr/local/rbenv/bin:$PATH' >> /etc/profile.d/rbenv.sh \
# &&  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /root/.bashrc \
# &&  echo 'export PATH=/usr/local/rbenv/bin:$PATH' >> /root/.bashrc \
# &&  echo 'eval "$(rbenv init -)"' >> /root/.bashrc

# ENV CONFIGURE_OPTS --disable-install-doc
# ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH

# RUN eval "$(rbenv init -)"; rbenv install 2.5.3 \
# &&  eval "$(rbenv init -)"; rbenv global 2.5.3 \
# &&  eval "$(rbenv init -)"; gem update --system \
# &&  eval "$(rbenv init -)"; gem i bundler --force

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y --fix-missing curl unzip

RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    rm /tmp/chromedriver_linux64.zip && \
    chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver && \
    ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver

RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get -yqq update && \
    apt-get -yqq install google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update 
# RUN apt-get -y install gnupg2
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs
RUN nodejs -v
RUN npm install -g gulp

WORKDIR /app
# COPY package*.json ./
RUN npm install -g parcel
RUN npm install
# COPY . .
RUN npm start
# CMD ["npm", "start"]



RUN mkdir cucumber
WORKDIR /cucumber
COPY Gemfile .

RUN gem install bundler --source http://rubygems.org &&\
    bundle install
