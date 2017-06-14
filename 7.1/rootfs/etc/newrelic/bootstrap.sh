#!/bin/sh

if [ "${NR_RELIC_INSTALL}" = "true" ]; then
    echo "New Relic Install Skipped"
    exit;
fi

export NR_INSTALL_SILENT=true

ini=/etc/php7/conf.d/newrelic.ini

# Set New Relic INI
cp /opt/newrelic/newrelic.ini ${ini}

# Update New Relic INI
sed -i "s/.*newrelic.license =.*/newrelic.license = \"${NR_INSTALL_KEY}\"/g" ${ini}

if [ ! -z "${APP_NAME}" ]; then
    sed -i "s/.*newrelic.appname =.*/newrelic.appname = \"${APP_NAME}\"/g" ${ini}
fi

if [ ! -z "${FRAMEWORK}" ]; then
    sed -i "s/.*newrelic.framework =.*/newrelic.framework = \"${FRAMEWORK}\"/g" ${ini}
fi

# Install new relic
/opt/newrelic/newrelic-install install

# Start the agent
/usr/bin/newrelic-daemon -c /etc/newrelic/newrelic.cfg --pidfile /var/run/newrelic-daemon.pid &

# Start FPM
/usr/sbin/php-fpm7 -R --nodaemonize