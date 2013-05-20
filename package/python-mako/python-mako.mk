PYTHON_MAKO_VERSION = 0.8.0
PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
PYTHON_MAKO_SITE = http://www.makotemplates.org/downloads
PYTHON_MAKO_DEPENDENCIES = python host-python-setuptools python-setuptools host-python-markupsafe python-markupsafe

define HOST_PYTHON_MAKO_BUILD_CMDS
        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define PYTHON_MAKO_BUILD_CMDS
        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
endef

define HOST_PYTHON_MAKO_INSTALL_CMDS
        (cd $(@D); PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
endef

define PYTHON_MAKO_INSTALL_TARGET_CMDS
        (cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
$(eval $(host-generic-package))

