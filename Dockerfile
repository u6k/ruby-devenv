FROM debian
LABEL maintainer="u6k.apps@gmail.com"

# Install Softwares
RUN apt update && \
    apt -y install curl vim ruby rails git git-flow tig && \
    apt autoremove && \
    apt clean

# Install Docker, docker-compose
RUN apt-get update && \
    apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -y install docker-ce && \
    apt-get autoremove && \
    apt-get clean && \
    curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Setting vim
COPY vimrc /root/.vimrc

RUN curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh && \
    vim +NeoBundleInstall +qall

# Setting
WORKDIR /var/my-app/

CMD ["bash"]

