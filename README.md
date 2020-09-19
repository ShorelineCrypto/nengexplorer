# How to setup explorer for NewEnglandcoin (NENG) 

This guide explains step by step at high level to self host an explorer for NewEnglandcoin (NENG) in a linux server.

Explorer requires a running full node of NENG with "-txindex".  You could use the same full node that you run Cheetah_Cpuminer on.
The explorer runs with mongodb that also needs around 1G of disk for storing the blockchain content in its database. 

## Example of Working NENG Explorer

http://nengexplorer.mooo.com:3001/

## Explorer software

* iquidus explorer - 1.6.1

https://github.com/iquidus/explorer 

The latest commit of iquidus explorer does not work with NENG. Earlier commit was used instead at:
https://github.com/iquidus/explorer/commits/bf99bb56eb4f0437c59d54a424882c2f839ca521


* Other software tested to be working


mongodb 4.4.1
node.js v12.18.4

## Error Handling on Nodejs installation for iquidus explorer

There might be a lot of failures and security warning after issuing "npm install --production"
Follow the warning guide and do several round of below command for the fix together with install:
npm audit fix
npm install
npm audit fix

