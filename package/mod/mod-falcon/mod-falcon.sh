#!/bin/sh

set -e

$INSTALL -d -m 0755 $TARGET_DIR/usr/share/webapps

# function modules
echo "Function modules ..."
$INSTALL -D -m 0755 $MOD/controller.exe $TARGET_DIR/usr/share/opendaf/function-modules/controller.exe
$INSTALL -d -m 0755 $TARGET_DIR/var/lib/opendaf/function-modules
ln -sf /usr/share/opendaf/function-modules/controller.exe $TARGET_DIR/var/lib/opendaf/function-modules/controller.exe

# index page
echo "Index page ..."
$INSTALL -D -m 0644 $MOD/index.html $TARGET_DIR/usr/share/webapps/index/index.html
$INSTALL -D -m 0644 $MOD/style.css $TARGET_DIR/usr/share/webapps/index/css/style.css

# falcon-ui
echo "UI ..."
tar -C $TARGET_DIR/usr/share/webapps -xf $MOD/falcon-ui.tgz
ln -sf ../../usr/share/webapps/falcon-ui $TARGET_DIR/var/www/falcon-ui

# lighttpd mod-specific conf
echo "lighttpd conf ..."
$INSTALL -D -m 0644 $MOD/lighttpd-mod.conf $TARGET_DIR/etc/lighttpd/conf.d/mod.conf

# dafman database update
echo "dafman database update scripts ..."
$INSTALL -D -m 0755 $MOD/update-dafman $TARGET_DIR/usr/sbin/update-dafman
$INSTALL -D -m 0644 $MOD/update-dafman.service $TARGET_DIR/etc/systemd/system/update-dafman.service
$INSTALL -d -m 0755 $TARGET_DIR/etc/systemd/system/multi-user.target.wants
ln -fs ../update-dafman.service $TARGET_DIR/etc/systemd/system/multi-user.target.wants/update-dafman.service

# mod upgrade script
echo "Upgrade script ..."
$INSTALL -D -m 0755 $MOD/upgrade $TARGET_DIR/usr/sbin/mod-upgrade

# KVDS on external storage
echo "KVDS on external storage ..."
$INSTALL -D -m 0755 $MOD/kvds-ext $TARGET_DIR/usr/libexec/cgi-bin/kvds-ext

echo "Astroclock  ..."
# astroclock configuration
$INSTALL -D -m 0755 $MOD/astroclock.conf $TARGET_DIR/etc/astroclock.conf

# astroclock runtime service
$INSTALL -D -m 0755 $MOD/astroclock $TARGET_DIR/var/spool/cron/crontabs/astroclock
$INSTALL -D -m 0755 $MOD/astro-op $TARGET_DIR/usr/libexec/cgi-bin/astro-op

# support keys
echo "Support keys ..."
$INSTALL -d -m 0700 $TARGET_DIR/etc/support
tar -C $TARGET_DIR/etc/support -xzf $MOD/falcon-support-keys.tgz

