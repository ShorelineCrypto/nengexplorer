# How to Setup Explorer for Nengcoin (NENG) 

This guide explains step by step at high level to self host an explorer for Nengcoin (NENG) in a linux server such as Ubuntu 18.04.

Explorer requires a full node of NENG with "-txindex" flag.  You could use the same full node that you run Cheetah_Cpuminer on.
The explorer runs with mongodb that also needs about 1G of disk for storing the blockchain content in its database. 

## Example of Working NENG Explorer

http://nengexplorer.mooo.com:3001/

## Explorer software

#### iquidus explorer - 1.6.2-legacy

The latest commit of iquidus explorer does not work with NENG.  Earlier version '1.6.2-legacy' branch was used instead at:
https://github.com/iquidus/explorer/tree/1.6.2-legacy

```
  git clone https://github.com/iquidus/explorer.git nengexplorer
  cd nengexplorer
  git checkout 1.6.2-legacy
  git pull 

```

#### Other software and working versions

* mongodb v4.2.13 
* node.js v12.18.4

Follow guide here for installing mongodb in various version of Ubuntu linux:

https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

For nodejs, we recommend using nvm method for installation. 

## Error Handling on Nodejs installation for iquidus explorer

There might be a lot of failures and security warning after issuing "npm install --production" in Ubuntu 18.04. 

Follow the warning guide and do several round of below command for fixing the errors:
```
npm audit fix
npm install
npm audit fix
```

After back and forth fix as shown above, your explorer folder should be ready for production. 

## Copy the NENG settings/logo and port forward to public

Copy the NENG logo file and setting file as example here. You can modify and change full node/mongodb user/password, port, etc to tailor to your needs. 

You can setup a port forward in your home router for 3001 port to be visable to public. There are also free DNS or Dynamic DNS providers 
that allow a domain URL to point to your home IPs for this purpose. 
