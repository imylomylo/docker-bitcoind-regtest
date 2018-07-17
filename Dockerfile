# Dockerfile must start with a FROM instruction
# FROM instruction specifies the Base Image from which you are building
# FROM <image>[:<tag>]
FROM ubuntu:16.04
# Install bitcoind from PPA
RUN apt-get update
RUN apt-get install --yes software-properties-common
RUN add-apt-repository --yes ppa:bitcoin/bitcoin
RUN apt-get update

# install bitcoind (from PPA) and make
RUN apt-get install --yes bitcoind

# copy bitcoin.conf
ADD . /home/bitcoind-testnet
    
# WORKDIR sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow
WORKDIR /home/bitcoind-testnet

# EXPOSE rpc port for the node to allow outside container access
EXPOSE 12001

# There can only be one CMD instruction in a Dockerfile
# CMD provides defaults for an executing container
# Drop user into bash shell by default
CMD ["/bin/bash"]

#docker run -it -p 5000:12001 bitcoind-test
#bitcoind -datadir=node -daemon
#bitcoin-cli -datadir=node generate 101
#bitcoin-cli getblockchaininfo 
#bitcoin-cli -datadir=node stop

#FROM ANOTHER TERMINAL
#curl --user someuser:somepass --data '{"method": "getblockchaininfo"}' http://127.0.0.1:5000
