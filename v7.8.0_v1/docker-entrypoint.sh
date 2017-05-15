#!/bin/bash
export PATH=$PATH:/usr/local/.nvm/versions/node/v7.8.0/bin
#export NEW_RELIC_NO_CONFIG_FILE=True
#export NEW_RELIC_APP_NAME=$NEWRELICAPPNAME
#export NEW_RELIC_LICENSE_KEY=$NEWRELICKEY
CODE_PATH='/var/www/html'
MONITOR='/var/www'
/bin/cp $MONITOR/newrelic.js  $CODE_PATH/newrelic.js
cd $CODE_PATH
#/bin/sed -i "s/app_name: .*/app_name: [\"$NEWRELICAPPNAME\"],/"   $CODE_PATH/newrelic.js
#/bin/sed -i "s/license_key: .*/license_key: \"$NEWRELICKEY\",/"   $CODE_PATH/newrelic.js
if [ -e $CODE_PATH/server/server.js ]
then
        #/bin/sed -i '1 irequire ("newrelic")' $CODE_PATH/server/server.js
        cd $CODE_PATH && /usr/local/.nvm/versions/node/v7.8.0/bin/node  server/server.js &
        #/bin/sed -i '1 irequire ("newrelic")' $PATH/consume/consume.js
        cd $CODE_PATH && /usr/local/.nvm/versions/node/v7.8.0/bin/node  consume/consume.js
else
	/bin/sed -ie '/newrelic/d' $CODE_PATH/bin/www
        /bin/sed -i '1 irequire ("newrelic")' $CODE_PATH/bin/www
        cd $CODE_PATH && /usr/local/.nvm/versions/node/v7.8.0/bin/npm  install && /usr/local/.nvm/versions/node/v7.8.0/bin/npm  install  newrelic &&  /usr/local/.nvm/versions/node/v7.8.0/bin/node  bin/www
fi
