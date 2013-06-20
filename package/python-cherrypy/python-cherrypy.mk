#############################################################
#
# python-cherrypy
#
#############################################################

PYTHON_CHERRYPY_VERSION = 3.2.4
PYTHON_CHERRYPY_SOURCE  = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
PYTHON_CHERRYPY_SITE    = http://pypi.python.org/packages/source/C/CherryPy/

PYTHON_CHERRYPY_DEPENDENCIES = python

define PYTHON_CHERRYPY_BUILD_CMDS
	(cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
	$(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
endef

define PYTHON_CHERRYPY_INSTALL_TARGET_CMDS
	(cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr; \
	sed -i s/#!.*/"\#!\/usr\/bin\/python"/ $(TARGET_DIR)/usr/bin/cherryd)
endef

$(eval $(generic-package))

