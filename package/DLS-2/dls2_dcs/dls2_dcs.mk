#############################################################
#
# DLS2_DCS
#
#############################################################
DLS2_DCS_VERSION = master
DLS2_DCS_SITE_METHOD = git
DLS2_DCS_SITE = git://merlin.swind.sk/oms/dls-2.git
DLS2_DCS_SUBDIR = dcs
DLS2_DCS_INSTALL_STAGING = NO
DLS2_DCS_INSTALL_TARGET = YES
DLS2_DCS_DEPENDENCIES = ACE
DLS2_DCS_SRCDIR = $(@D)/$(DLS2_DCS_SUBDIR)

#define DLS2_DCS_INITSCRIPT
#	$(INSTALL) -D -m 0755 $(DLS2_DCS_SRCDIR)/initscript-dls2_hwtest $(TARGET_DIR)/etc/init.d/S90dls2_hwtest
#endef

DLS2_DCS_POST_INSTALL_TARGET_HOOKS += DLS2_DCS_INITSCRIPT

$(eval $(cmake-package))

