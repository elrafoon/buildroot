#############################################################
#
# OPENDAF_APPCONF
#
#############################################################
OPENDAF_APPCONF_VERSION = $(BR2_PACKAGE_OPENDAF_APPCONF_NAME)
OPENDAF_APPCONF_SITE_METHOD = git
OPENDAF_APPCONF_SITE = gitolite@merlin.swind.sk:OpenDAF-AppConf.git
OPENDAF_APPCONF_INSTALL_STAGING = NO
OPENDAF_APPCONF_INSTALL_TARGET = YES
OPENDAF_APPCONF_DEPENDENCIES = opendaf

define OPENDAF_APPCONF_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))

