PYTHON_MARKUPSAFE_VERSION = 0.15
PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
PYTHON_MARKUPSAFE_SITE = https://pypi.python.org/packages/source/M/MarkupSafe/
PYTHON_MARKUPSAFE_DEPENDENCIES = python host-python-setuptools python-setuptools

define HOST_PYTHON_MARKUPSAFE_BUILD_CMDS
        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_MARKUPSAFE_BUILD_CMDS
        (cd $(@D); \
                PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LD="$(TARGET_LD)" \
                LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
        $(HOST_DIR)/usr/bin/python setup.py build)
endef

define HOST_PYTHON_MARKUPSAFE_INSTALL_CMDS
        (cd $(@D); PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
endef

define PYTHON_MARKUPSAFE_INSTALL_TARGET_CMDS
        (cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
$(eval $(host-generic-package))

