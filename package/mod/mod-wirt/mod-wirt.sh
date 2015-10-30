#!/bin/sh

set -e

mkdir -p $TARGET_DIR/usr/share/webapps

# function modules
install -D -m 0755 $MOD/controller.exe $TARGET_DIR/usr/share/opendaf/function-modules/controller.exe
mkdir -p $TARGET_DIR/var/lib/opendaf/function-modules
ln -sf /usr/share/opendaf/function-modules/controller.exe $TARGET_DIR/var/lib/opendaf/function-modules/controller.exe

# wirt-ui
tar -C $TARGET_DIR/usr/share/webapps -xf $MOD/wirt-ui.tgz
cd $TARGET_DIR/var/www && ln -sf ../../usr/share/webapps/wirt-ui wirt-ui

# index page
install -D -m 0644 $MOD/index.html $TARGET_DIR/usr/share/webapps/index/index.html
install -D -m 0644 $MOD/style.css $TARGET_DIR/usr/share/webapps/index/css/style.css

# KVDS on external storage
#cat <<EOF >$TARGET_DIR/usr/libexec/cgi-bin/kvds-ext
##!/bin/sh
#
#KVDS_ROOT=/srv/kvds exec /usr/bin/kvds cgi
#EOF
#chmod 755 $TARGET_DIR/usr/libexec/cgi-bin/kvds-ext
#
## lighttpd mod-specific configuration
#cat <<EOF >$TARGET_DIR/etc/lighttpd/conf.d/mod.conf
#url.rewrite-once += (
#	"^/astroclock/(.*)" => "/cgi-bin/astro-op/\$1",
#	"^/kvds-ext/(.*)" => "/cgi-bin/kvds-ext/\$1"
#)
#EOF

# support keys
#install -d -m 0700 $TARGET_DIR/etc/support
#cat $MOD/apollo-support-keys.tgz | tar -C $TARGET_DIR/etc/support -xz

