#############################################################
#
# DLS2_DCS
#
#############################################################
DLS2_DCS_VERSION = master
DLS2_DCS_SITE_METHOD = git
DLS2_DCS_SITE = git://merlin.swind.sk/oms/dls-2.git
DLS2_DCS_SUBDIR = dcs
DLS2_DCS_INSTALL_STAGING = YES
DLS2_DCS_INSTALL_TARGET = YES
DLS2_DCS_DEPENDENCIES = ACE boost
DLS2_DCS_SRCDIR = $(@D)/$(DLS2_DCS_SUBDIR)
DLS2_DCS_CONF_OPT += -DTARGET_PLATFORM=TX48

define DLS2_DCS_REMOVE_DEVEL
	rm -rf $(TARGET_DIR)/usr/include/dcs
endef

DLS2_DCS_POST_INSTALL_TARGET_HOOKS += DLS2_DCS_REMOVE_DEVEL

$(eval $(cmake-package))

