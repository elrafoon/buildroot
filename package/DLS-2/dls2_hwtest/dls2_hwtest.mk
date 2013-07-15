#############################################################
#
# DLS2_HWTEST
#
#############################################################
DLS2_HWTEST_VERSION = master
DLS2_HWTEST_SITE_METHOD = git
DLS2_HWTEST_SITE = ssh://merlin.swind.sk:29418/embedded-tools.git
DLS2_HWTEST_SUBDIR = dls2_hwtest
DLS2_HWTEST_INSTALL_STAGING = NO
DLS2_HWTEST_INSTALL_TARGET = YES
DLS2_HWTEST_DEPENDENCIES = wireless_tools bluez_utils qt
DLS2_HWTEST_SRCDIR = $(@D)/$(DLS2_HWTEST_SUBDIR)

define DLS2_HWTEST_INITSCRIPT
	$(INSTALL) -D -m 0755 $(DLS2_HWTEST_SRCDIR)/initscript-dls2_hwtest $(TARGET_DIR)/etc/init.d/S90dls2_hwtest
endef

DLS2_HWTEST_POST_INSTALL_TARGET_HOOKS += DLS2_HWTEST_INITSCRIPT

$(eval $(cmake-package))

