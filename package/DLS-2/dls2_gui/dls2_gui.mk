#############################################################
#
# DLS2_GUI
#
#############################################################
DLS2_GUI_VERSION = master
DLS2_GUI_SITE_METHOD = git
DLS2_GUI_SITE = git://merlin.swind.sk/oms/dls-2.git
DLS2_GUI_SUBDIR = gui
DLS2_GUI_INSTALL_STAGING = NO
DLS2_GUI_INSTALL_TARGET = YES
DLS2_GUI_DEPENDENCIES = qt dls2_dcs
DLS2_GUI_SRCDIR = $(@D)/$(DLS2_GUI_SUBDIR)
DLS2_GUI_CONF_OPT += -DHIDE_WINDOW_DECORATION=1

define DLS2_GUI_INITSCRIPT
        $(INSTALL) -D -m 0755 $(DLS2_GUI_SRCDIR)/etc/initscript-dls2_gui $(TARGET_DIR)/etc/init.d/S90dls2_gui
endef

DLS2_GUI_POST_INSTALL_TARGET_HOOKS += DLS2_GUI_INITSCRIPT

$(eval $(cmake-package))

