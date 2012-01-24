#############################################################
#
# ddgd
#
#############################################################
DDGD_VERSION = HEAD
DDGD_SITE = svn://merlin.swind.sk/svn/oms/dls/trunk/dls-device-gui/design-qml
DDGD_SITE_METHOD = svn
DDGD_INSTALL_STAGING = NO
DDGD_INSTALL_TARGET = YES

define DDGD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/opt/dls/design-qml
	cp -r $(@D)/* $(TARGET_DIR)/opt/dls/design-qml
endef

$(eval $(call GENTARGETS))

