FROM debian
LABEL maintainer="u6k.apps@gmail.com"

# Install Softwares
RUN apt update && \
    apt -y install curl vim ruby rails git git-flow tig

# Install Docker, docker-compose
RUN apt-get update && \
    apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -y install docker-ce && \
    curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Setting vim
COPY vimrc /root/.vimrc

RUN curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh && \
    vim +NeoBundleInstall +qall

# Install and Setting textlint
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs && \
    npm install textlint --global && \
    npm install textlint-rule-preset-ja-technical-writing --global

COPY textlintrc /root/.textlintrc

# Install RedPen
RUN apt -y install openjdk-8-jre && \
    cd /usr/local/src/ && \
    curl -OL https://github.com/redpen-cc/redpen/releases/download/redpen-1.10.1/redpen-1.10.1.tar.gz && \
    tar zxvf redpen-1.10.1.tar.gz && \
    ln -s /usr/local/src/redpen-distribution-1.10.1/bin/redpen /usr/local/bin/redpen

# Setting
WORKDIR /var/my-app/

CMD ["bash"]

