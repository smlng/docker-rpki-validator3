#!/usr/bin/env bash
[ -f ./conf/tals/*.tal ] && {
    cp ./conf/tals/*.tal /var/lib/rpki-validator-3/preconfigured-tals/.
}
[ -f ./conf/*.properties ] && {
    cp ./conf/application.properties /etc/rpki-validator-3/.
}
JAVA_CMD=/usr/bin/java CONFIG_DIR=/etc/rpki-validator-3 JAR=/usr/lib/rpki-validator-3.jar /usr/bin/rpki-validator-3.sh
