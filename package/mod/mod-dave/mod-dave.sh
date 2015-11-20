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

exists() { [[ -f $1 ]]; }

if [ "$BRAND" == "" ]; then
	BRAND=dave
fi

install -d $TARGET_DIR/usr/share/webapps/index/css
install -d $TARGET_DIR/usr/share/webapps/index/img

pushd $MOD/brand/$BRAND
exists *.html && install -m 0644 *.html $TARGET_DIR/usr/share/webapps/index/
exists *.css && install -m 0644 *.css $TARGET_DIR/usr/share/webapps/index/css
exists *.png && install -m 0644 *.png $TARGET_DIR/usr/share/webapps/index/img
exists *.jpg && install -m 0644 *.jpg $TARGET_DIR/usr/share/webapps/index/img
popd


# dave-ui
echo "UI ..."

if [[ -n "$BRAND" && -e $MOD/dave-ui-$BRAND.tgz ]]; then
	tar -C $TARGET_DIR/usr/share/webapps -xf $MOD/dave-ui-$BRAND.tgz
else
	tar -C $TARGET_DIR/usr/share/webapps -xf $MOD/dave-ui.tgz
fi
cd $TARGET_DIR/var/www && ln -sf ../../usr/share/webapps/dave-ui dave-ui

# support keys
echo "Support keys ..."
$INSTALL -d -m 0700 $TARGET_DIR/etc/support
tar -C $TARGET_DIR/etc/support -xzf $MOD/dave-support-keys.tgz

