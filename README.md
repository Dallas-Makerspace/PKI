# About this repository [![Build Status](https://travis-ci.org/Dallas-Makerspace/PKI.svg?branch=master)](https://travis-ci.org/Dallas-Makerspace/PKI)
CI/CD Generated EV SSL certificate requests and keys

## How to

1. `git clone https://github.com/Dallas-Makerspace/PKI.git dms-pki && cd $_`
1. `export FQDN="my.example.tld"`
1. `mkdir -p $FQDN/pki/ && touch $FQDN/pki/.gitkeep`
1. `cp config.template $FQDN/config`
1. `$EDITOR $FQDN/config`
1. update lines 1 and 2 with correct $FQDN and ip address
1. append additionally needed DNS.# and IP.# in the san_records block
1. update .travis.yml  `DOMAIN:` value to match your `"$FQDN"`
1. `git commit && git push`
1. click on the job status here and collect the csr and server.key
1. pass the csr to a top level CA such as letsencrypt, CACerts.org, or Verisign
1. scp server.key and returned server.crt to foundation servers `/srv/ssl/$FQDN.{key,crt}
