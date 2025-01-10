FROM mongo:4.2.24

RUN apt-get update && \
        apt-get -y install  wget curl vim nano git

ENV HOME=/root
WORKDIR /root

# Installing Node
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
RUN source /root/.bashrc && nvm install 12.18.4
SHELL ["/bin/bash", "--login", "-c"]

RUN git clone https://github.com/ShorelineCrypto/nengexplorer.git  nengexplorer-slc
RUN git clone  https://github.com/iquidus/explorer.git  nengexplorer
RUN wget https://github.com/ShorelineCrypto/nengcoin/releases/download/v2.4.0/nengcoin_2.4.0_x86_64_linux-gnu.tgz
RUN tar xvfz nengcoin_2.4.0_x86_64_linux-gnu.tgz
RUN rm nengcoin_2.4.0_x86_64_linux-gnu.tgz

