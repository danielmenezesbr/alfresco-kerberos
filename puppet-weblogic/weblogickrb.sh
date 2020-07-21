#!/usr/bin/env bash
sudo cp -a /weblogicfiles/httpclientlinux.keytab /opt/oracle/wlsdomains/domains/Wls1221/
sudo chown oracle:dba /opt/oracle/wlsdomains/domains/Wls1221/httpclientlinux.keytab

# falta krb5...

sudo sh -c 'cat >/opt/oracle/wlsdomains/domains/Wls1221/krb5Login.conf <<EOF
com.sun.security.jgss.initiate {
   com.sun.security.auth.module.Krb5LoginModule required
   principal="HTTP/clientlinux.mshome.net@MSHOME.NET"
   useKeyTab=true
   keyTab="httpclientlinux.keytab"
   storeKey=true
   debug=true;
};
com.sun.security.jgss.krb5.accept {
   com.sun.security.auth.module.Krb5LoginModule required
   principal="HTTP/clientlinux.mshome.net@MSHOME.NET"
   useKeyTab=true
   keyTab="httpclientlinux.keytab"
   storeKey=true
   debug=true;
};
EOF'

sudo chown oracle:dba /opt/oracle/wlsdomains/domains/Wls1221/krb5Login.conf
