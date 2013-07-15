#############################################################
#
# DLS2_DCS
#
#############################################################
DLS2_DCS_VERSION = master
DLS2_DCS_SITE_METHOD = git
DLS2_DCS_SITE = ssh://merlin.swind.sk:29418/oms/dls-2.git
DLS2_DCS_SUBDIR = dcs
DLS2_DCS_INSTALL_STAGING = YES
DLS2_DCS_INSTALL_TARGET = YES
DLS2_DCS_DEPENDENCIES = ACE boost python host-python-mako python-mako host-dls2_dcsconfig sqlite host-swig surpc protobuf
DLS2_DCS_SRCDIR = $(@D)/$(DLS2_DCS_SUBDIR)
DLS2_DCS_CONF_OPT += -DTARGET_PLATFORM=TX48 -DMAKO_RENDER=$(HOST_DIR)/usr/bin/mako-render -DSWIG_EXECUTABLE=$(HOST_DIR)/usr/bin/swig -DSWIG_DIR=$(HOST_DIR)/usr/share/swig/2.0.9 -DSURPC_PREFIX=$(STAGING_DIR)/usr 

define DLS2_DCS_REMOVE_DEVEL
	rm -rf $(TARGET_DIR)/usr/include/dcs
endef

DLS2_DCS_POST_INSTALL_TARGET_HOOKS += DLS2_DCS_REMOVE_DEVEL

$(eval $(cmake-package))

