DLS2_WEB_VERSION = $(BR2_PACKAGE_DLS2_VERSION)
DLS2_WEB_SITE = ssh://merlin.swind.sk:29418/oms/dls-2.git
DLS2_WEB_SITE_METHOD = git
DLS2_WEB_SUBDIR = web
DLS2_WEB_SRCDIR = $(@D)/$(DLS2_DCS_SUBDIR)
DLS2_WEB_DEPENDENCIES = host-python host-protobuf python-cherrypy python-simplejson surpc 

define DLS2_WEB_BUILD_CMDS
        (cd $(DLS2_WEB_SRCDIR); PROTOC=$(HOST_DIR)/usr/bin/protoc $(HOST_DIR)/usr/bin/python setup.py build\
		--executable=/usr/bin/python)
endef

define DLS2_WEB_INSTALL_TARGET_CMDS
        (cd $(DLS2_WEB_SRCDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
endef

define DLS2_WEB_INITSCRIPT
        $(INSTALL) -D -m 0755 $(DLS2_WEB_SRCDIR)/etc/initscript-dls2 $(TARGET_DIR)/etc/init.d/S95dls2_web
endef

define DLS2_WEB_CONFIGURATION
	$(INSTALL) -D -m 0644 package/DLS-2/dls2_web/web.conf $(TARGET_DIR)/etc/dcs/web.conf
endef

DLS2_WEB_POST_INSTALL_TARGET_HOOKS += DLS2_WEB_INITSCRIPT
DLS2_WEB_POST_INSTALL_TARGET_HOOKS += DLS2_WEB_CONFIGURATION

$(eval $(generic-package))

