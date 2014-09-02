################################################################################
#
# json-c
#
################################################################################

JSON_C_VERSION = 0.11
JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
JSON_C_INSTALL_STAGING = YES
JSON_C_MAKE = $(MAKE1)
JSON_C_CONF_OPT = --disable-oldname-compat
JSON_C_LICENSE = MIT
JSON_C_LICENSE_FILES = COPYING

define JSON_C_INSTALL_COMPAT_SHIM
	$(INSTALL) -D -m 0644 $(@D)/json.pc $(STAGING_DIR)/usr/lib/pkgconfig/json.pc
endef

JSON_C_POST_INSTALL_STAGING_HOOKS += JSON_C_INSTALL_COMPAT_SHIM

$(eval $(autotools-package))
