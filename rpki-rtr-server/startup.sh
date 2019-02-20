#!/usr/bin/env bash
[ -f ./conf/*.properties ] && {
    cp ./conf/* /etc/rpki-rtr-server/.
}
sleep 42
JAVA_CMD=/usr/bin/java CONFIG_DIR=/etc/rpki-rtr-server JAR=/usr/lib/rpki-rtr-server.jar /usr/bin/rpki-rtr-server.sh
