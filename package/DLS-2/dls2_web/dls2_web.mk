DLS2_WEB_VERSION = master
DLS2_WEB_SITE = git://merlin.swind.sk/oms/dls-2.git
DLS2_WEB_SITE_METHOD = git
DLS2_WEB_SUBDIR = web
DLS2_WEB_SRCDIR = $(@D)/$(DLS2_DCS_SUBDIR)
DLS2_WEB_DEPENDENCIES = host-python host-protobuf python-cherrypy surpc 

define DLS2_WEB_BUILD_CMDS
        (cd $(DLS2_WEB_SRCDIR); PROTOC=$(HOST_DIR)/usr/bin/protoc $(HOST_DIR)/usr/bin/python setup.py build\
		--executable=/usr/bin/python)
endef

define DLS2_WEB_INSTALL_TARGET_CMDS
        (cd $(DLS2_WEB_SRCDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))

