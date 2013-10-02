#############################################################
#
# OPENDAF
#
#############################################################
OPENDAF_VERSION = master
OPENDAF_SITE_METHOD = git
OPENDAF_SITE = ssh://merlin.swind.sk:29418/OpenDAF.git
OPENDAF_INSTALL_STAGING = NO
OPENDAF_INSTALL_TARGET = YES
OPENDAF_DEPENDENCIES = ACE boost

ifeq ($(BR2_PACKAGE_OPENDAF_DEVEL),y)
	OPENDAF_INSTALL_DEVEL_CFG=ON
else
	OPENDAF_INSTALL_DEVEL_CFG=OFF
endif

OPENDAF_CONF_OPT += -DINSTALL_DEVEL_CFG=$(OPENDAF_INSTALL_DEVEL_CFG)

define OPENDAF_INSTALL_INITSCRIPT
	$(INSTALL) -D -m 0755 package/opendaf/S90opendaf $(TARGET_DIR)/etc/init.d/S90opendaf
endef

OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_INITSCRIPT

$(eval $(cmake-package))

