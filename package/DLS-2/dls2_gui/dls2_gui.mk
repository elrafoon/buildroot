#############################################################
#
# DLS2_GUI
#
#############################################################
DLS2_GUI_VERSION = $(BR2_PACKAGE_DLS2_VERSION)
DLS2_GUI_SITE_METHOD = git
DLS2_GUI_SITE = ssh://merlin.swind.sk:29418/oms/dls-2.git
DLS2_GUI_SUBDIR = gui
DLS2_GUI_INSTALL_STAGING = NO
DLS2_GUI_INSTALL_TARGET = YES
DLS2_GUI_DEPENDENCIES = qt dls2_dcs
DLS2_GUI_SRCDIR = $(@D)/$(DLS2_GUI_SUBDIR)
DLS2_GUI_CONF_OPT += -DTARGET_PLATFORM=TX48 -DHIDE_WINDOW_DECORATION=1 -DGUI_VERSION=$(DLS2_GUI_VERSION)

define DLS2_GUI_INITSCRIPT
        $(INSTALL) -D -m 0755 $(DLS2_GUI_SRCDIR)/etc/initscript-dls2_gui $(TARGET_DIR)/etc/init.d/S90dls2_gui
endef

DLS2_GUI_POST_INSTALL_TARGET_HOOKS += DLS2_GUI_INITSCRIPT

$(eval $(cmake-package))

