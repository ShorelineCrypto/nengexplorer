# How to Setup Explorer for Nengcoin (NENG) 

This guide explains step by step at high level to self host an explorer for Nengcoin (NENG) in a linux server with docker / docker-compose installed.

The explorer runs with mongodb that also needs about 5.6G of disk for storing the blockchain content in its database plus full node disk requirement of 4.2G. 

## Example of Working NENG Explorer

http://nengexplorer.mooo.com:3001/

## Explorer software

The nengexplorer is powered in its engine by open sourced software eIquidus inside docker container. The eIqidus explorer github can be found at:
https://github.com/team-exor/eiquidus

eIquidus github documentation has tons of instructions to configure mongodb and explorer software. The nengexplorer has automated most of steps with docker method.
You can follow documentation for understanding docker setup steps or run the same software without docker. 

#### git clone nengexplorer

The mongodb database folder is cross mounted at "~/nengexplorerdb" while "~/mongo_backup" is mounted as backup folder for mongodb. 

```
  cd ~
  git clone https://github.com/ShorelineCrypto/nengexplorer.git
  mkdir nengexplorerdb mongo_backup

```

#### build docker image and start container

You can pull a public docker image with below command:

```
  docker pull shorelinecrypto/nengexplorer:latest
  docker tag shorelinecrypto/nengexplorer:latest nengexplorer:latest
```

Alternatively at first step, you can build nengexplorer:latest image with below command:

```
  cd ~
  docker-compose up -d
  
```

The above will run container when the docker image exist locally. 

to build manually:

```
  docker build -t nengexplorer .
```

to stop container:
```
docker-compose down
```

#### config/run mongodb/nengexplorer

The mongodb is built in the docker image, you can perform below to configure a working explore and mongodb user account.

```
  docker exec -it nengexplorer /bin/bash
```

Above should allow you to login inside a running container, under path "/root/eiquidus" on root user, run below:
```
  mongosh
  use explorerdb
  db.createUser( { user: "eiquidus", pwd: "Nd^p2d77ceBX!L", roles: [ "readWrite" ] } )
  exit
```

The above completed mongodb database user account setup. Run below to start explorer web:

```
   cp nengcoin.conf ~/.nengcoin/
   ~/nengcoin_2.4.0_x86_64_linux-gnu/nengcoind
   nohup bash loop_sync.sh &
   npm start
```

Now your nengexplorer should be running at your http://Your Hostname or IP:3001 web URL.
The initial sync will take about overnight time for full Nengcoin blockchain update from beginning. 

