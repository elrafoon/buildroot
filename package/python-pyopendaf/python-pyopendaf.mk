################################################################################
#
# python-pyopendaf
#
################################################################################

PYTHON_PYOPENDAF_VERSION      = master
PYTHON_PYOPENDAF_SITE_METHOD  = git
PYTHON_PYOPENDAF_SITE         = ssh://merlin.swind.sk:29418/PyOpenDAF.git
PYTHON_PYOPENDAF_DEPENDENCIES = python python-zope.interface

define PYTHON_PYOPENDAF_BUILD_CMDS
	(cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
	$(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
endef

define PYTHON_PYOPENDAF_INSTALL_TARGET_CMDS
	(cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))

