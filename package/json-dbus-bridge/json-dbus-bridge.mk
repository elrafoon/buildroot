################################################################################
#
# json-dbus-bridge
#
################################################################################

JSON_DBUS_BRIDGE_VERSION = v1.1.5
JSON_DBUS_BRIDGE_SITE = https://gitorious.org/json-dbus-bridge/json-dbus-bridge.git
JSON_DBUS_BRIDGE_SITE_METHOD = git
JSON_DBUS_BRIDGE_LICENSE = LGPLv2.1
JSON_DBUS_BRIDGE_LICENSE_FILES = COPYING
JSON_DBUS_BRIDGE_AUTORECONF = YES
JSON_DBUS_BRIDGE_DEPENDENCIES = dbus json-c libfcgi libevent

$(eval $(autotools-package))
