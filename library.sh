#!/bin/sh
## pki/library
# Sourcable lib for bash/shell/rc
# usage: . $0
#    help()   - display's avialble commands and thier general usage.

declare -x -f help

help() {
  pod2man $0 | nrof -man /dev/stdin | $PAGER
}


#usage: genssl "service.example.tld"
genssl() { [ -f $1/config ] && openssl req -config ${1}/config -new -batch > ${1}/csr; }

#usage: csrverify (-in <filepath> | < filepath | {stdin} )
alias csrverify='openssl req -text -noout -verify'

#usage: rsaverify (-in <filepath> | < filepath | {stdin} )
alias rsaverify='openssl x509 -noout -verify'


: <<=cut
=pod
=head1 HEADER

    library.sh - Generic SSL utility functions
    
=head1 SYNOPSIS

   import with source ${0}
   bash ./${0} [-h|--help|/\?|/h]
   
=head1 DESCRIPTION

This is a simple way to manage csr, rsa, and ssl certs via bash.

=head1 AUTHOR

B<Dwight Spencer>

No Rights Reserved.

=cut
