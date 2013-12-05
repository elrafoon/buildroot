UHMI_DEMOS_VERSION = master
UHMI_DEMOS_SITE = ssh://merlin.swind.sk:29418/uHMI-demos
UHMI_DEMOS_SITE_METHOD = git
UHMI_DEMOS_DEPENDENCIES = uHMI
UHMI_DEMOS_SUBDIR = $(BR2_PACKAGE_UHMI_DEMOS_DEMO)

define UHMI_DEMOS_CREATE_INDEX
	ln -sf $(BR2_PACKAGE_UHMI_DEMOS_INDEX) $(TARGET_DIR)/usr/share/opendaf/webroot/index.html
endef

ifneq ($(BR2_PACKAGE_UHMI_DEMOS_INDEX),"")
	UHMI_DEMOS_POST_INSTALL_TARGET_HOOKS += UHMI_DEMOS_CREATE_INDEX
endif

$(eval $(cmake-package))

