DLS2_DCSCONFIG_VERSION = $(BR2_PACKAGE_DLS2_VERSION)
DLS2_DCSCONFIG_SITE_METHOD = git
DLS2_DCSCONFIG_SITE = ssh://merlin.swind.sk:29418/oms/dls-2.git
DLS2_DCSCONFIG_SUBDIR = dcsconfig
DLS2_DCSCONFIG_SRCDIR = $(@D)/$(DLS2_DCS_SUBDIR)
DLS2_DCSCONFIG_DEPENDENCIES = host-python

define HOST_DLS2_DCSCONFIG_BUILD_CMDS
        (cd $(DLS2_DCSCONFIG_SRCDIR); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define DLS2_DCSCONFIG_BUILD_CMDS
        (cd $(DLS2_DCSCONFIG_SRCDIR); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define HOST_DLS2_DCSCONFIG_INSTALL_CMDS
        (cd $(DLS2_DCSCONFIG_SRCDIR); PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
endef

define DLS2_DCSCONFIG_INSTALL_TARGET_CMDS
        (cd $(DLS2_DCSCONFIG_SRCDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
$(eval $(host-generic-package))

