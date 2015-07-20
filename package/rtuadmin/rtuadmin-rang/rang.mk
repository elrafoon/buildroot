################################################################################
#
# rtuadmin-rang
#
################################################################################

RTUADMIN_RANG_VERSION = 7aedbec
RTUADMIN_RANG_SITE_METHOD = git
RTUADMIN_RANG_SITE = gitolite@merlin.swind.sk:rtuadmin-rang.git

define RTUADMIN_RANG_INSTALL_TARGET_RTUADMIN_RANG
	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/systemd/system/basic.target.wants/
	$(INSTALL) -D -m 0644 package/rtuadmin/rtuadmin-rang/rang-render.service $(TARGET_DIR)/etc/systemd/system/rang-render.service
	ln -sf ../rang-render.service $(TARGET_DIR)/etc/systemd/system/basic.target.wants/rang-render.service
	$(INSTALL) -D -m 0644 package/rtuadmin/rtuadmin-rang/rang-install.service $(TARGET_DIR)/etc/systemd/system/rang-install.service
	ln -sf ../rang-install.service $(TARGET_DIR)/etc/systemd/system/basic.target.wants/rang-install.service
endef

define RTUADMIN_RANG_INSTALL_TARGET_RTUADMIN_RANG_CGI_$(BR2_PACKAGE_RTUADMIN_RANG_CGI)
	mkdir -p $(TARGET_DIR)/usr/libexec/cgi-bin/
	ln -sf /usr/bin/rang-cgi $(TARGET_DIR)/usr/libexec/cgi-bin/rang
endef

RTUADMIN_RANG_POST_INSTALL_TARGET_HOOKS += RTUADMIN_RANG_INSTALL_TARGET_RTUADMIN_RANG
RTUADMIN_RANG_POST_INSTALL_TARGET_HOOKS += RTUADMIN_RANG_INSTALL_TARGET_RTUADMIN_RANG_CGI_y

$(eval $(generic-package))

