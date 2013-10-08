OPENBOX_WEBADMIN_VERSION = $(BR2_PACKAGE_OPENBOX_WEBADMIN_VERSION)
OPENBOX_WEBADMIN_SITE = ssh://merlin.swind.sk:29418/openbox-webadmin
OPENBOX_WEBADMIN_SITE_METHOD = git
OPENBOX_WEBADMIN_MODEL_SUBDIR = model
OPENBOX_WEBADMIN_RENDERER_SUBDIR = renderer
OPENBOX_WEBADMIN_WEB_SUBDIR = web
OPENBOX_WEBADMIN_SRCDIR = $(@D)/$(OPENBOX_WEBADMIN_WEB_SUBDIR)
OPENBOX_WEBADMIN_DEPENDENCIES = python host-python python-cherrypy

define OPENBOX_WEBADMIN_BUILD_CMDS
        (cd $(@D)/$(OPENBOX_WEBADMIN_MODEL_SUBDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        make ROOTFS=$(TARGET_DIR) PREFIX=/usr PYTHON=$(HOST_DIR)/usr/bin/python TARGET_PYTHON=/usr/bin/python build)

	(cd $(@D)/$(OPENBOX_WEBADMIN_RENDERER_SUBDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        make ROOTFS=$(TARGET_DIR) PREFIX=/usr PYTHON=$(HOST_DIR)/usr/bin/python TARGET_PYTHON=/usr/bin/python build)

	(cd $(@D)/$(OPENBOX_WEBADMIN_WEB_SUBDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
endef

define OPENBOX_WEBADMIN_INSTALL_TARGET_CMDS
        (cd $(@D)/$(OPENBOX_WEBADMIN_MODEL_SUBDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        make ROOTFS=$(TARGET_DIR) PREFIX=/usr PYTHON=$(HOST_DIR)/usr/bin/python TARGET_PYTHON=/usr/bin/python install)

	(cd $(@D)/$(OPENBOX_WEBADMIN_RENDERER_SUBDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        make ROOTFS=$(TARGET_DIR) PREFIX=/usr PYTHON=$(HOST_DIR)/usr/bin/python TARGET_PYTHON=/usr/bin/python install)

	(cd $(@D)/$(OPENBOX_WEBADMIN_WEB_SUBDIR); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
        $(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
endef

define OPENBOX_WEBADMIN_CONFIGURATION
	$(INSTALL) -D -m 0644 package/OPENBOX/openbox_webadmin/web.conf $(TARGET_DIR)/etc/dcs/web.conf
endef

#OPENBOX_WEBADMIN_POST_INSTALL_TARGET_HOOKS += OPENBOX_WEBADMIN_CONFIGURATION

define OPENBOX_WEBADMIN_INSTALL_INITSCRIPT
        $(INSTALL) -D -m 0755 package/OPENBOX/openbox_webadmin/S95openbox_webadmin $(TARGET_DIR)/etc/init.d/S95openbox_webadmin
endef

define OPENBOX_WEBADMIN_INSTALL_RUNIT_SERVICE
        $(INSTALL) -D -m 0755 package/OPENBOX/openbox_webadmin/runit-run $(TARGET_DIR)/etc/service/openbox_webadmin/run
endef

ifeq ($(BR2_PACKAGE_OPENBOX_WEBADMIN_STARTUP_INITSCRIPT),y)
        OPENBOX_WEBADMIN_POST_INSTALL_TARGET_HOOKS += OPENBOX_WEBADMIN_INSTALL_INITSCRIPT
else ifeq ($(BR2_PACKAGE_OPENBOX_WEBADMIN_STARTUP_RUNIT),y)
        OPENBOX_WEBADMIN_POST_INSTALL_TARGET_HOOKS += OPENBOX_WEBADMIN_INSTALL_RUNIT_SERVICE
endif

$(eval $(generic-package))

