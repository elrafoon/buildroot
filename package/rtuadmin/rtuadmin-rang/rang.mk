################################################################################
#
# rtuadmin-rang
#
################################################################################

RTUADMIN_RANG_VERSION = 39c0719
RTUADMIN_RANG_SITE_METHOD = git
RTUADMIN_RANG_SITE = gitolite@merlin.swind.sk:rtuadmin-rang.git

define RTUADMIN_RANG_INSTALL_TARGET_RTUADMIN_RANG
	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
	$(INSTALL) -D -m 0644 $(TARGET_DIR)/var/lib/rang/cfg.json $(TARGET_DIR)/usr/share/rang/cfg.json
	$(INSTALL) -D -m 0644 package/rtuadmin/rtuadmin-rang/rang-render.service $(TARGET_DIR)/etc/systemd/system/rang-render.service
	mkdir -p $(TARGET_DIR)/etc/systemd/system/basic.target.wants
	ln -sf ../rang-render.service $(TARGET_DIR)/etc/systemd/system/basic.target.wants/rang-render.service
endef

define RTUADMIN_RANG_INSTALL_TARGET_RTUADMIN_RANG_CGI_$(BR2_PACKAGE_RTUADMIN_RANG_CGI)
	ln -sf /usr/bin/rang-cgi $(TARGET_DIR)/usr/libexec/cgi-bin/rang
endef

RTUADMIN_RANG_POST_INSTALL_TARGET_HOOKS += RTUADMIN_RANG_INSTALL_TARGET_RTUADMIN_RANG
RTUADMIN_RANG_POST_INSTALL_TARGET_HOOKS += RTUADMIN_RANG_INSTALL_TARGET_RTUADMIN_RANG_CGI_y

$(eval $(generic-package))

