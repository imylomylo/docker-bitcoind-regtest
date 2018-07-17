```
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
mkdir docker-bitcoind
cd docker-bitcoind
mkdir node
cd node
echo '
regtest=1
dnsseed=0
upnp=0
port=12000
rpcport=12001
server=1
rpcallowip=0.0.0.0/0
rpcuser=someuser
rpcpassword=somepass
'>bitcoin.conf
cd ..
docker build -t bitcoind-test
docker images
docker run -it -p 5000:12001 bitcoind-test


```
Then have a look at the comments at the end of the Dockerfile
