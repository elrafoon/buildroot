################################################################################
#
# rc232-responder
#
################################################################################

RC232_RESPONDER_VERSION = a5afb1e
RC232_RESPONDER_SITE_METHOD = git
RC232_RESPONDER_SITE = gitolite@merlin.swind.sk:embedded-tools.git
RC232_RESPONDER_LICENSE = BSD-3c
RC232_RESPONDER_SUBDIR = rc232-responder
RC232_RESPONDER_SETUP_TYPE = setuptools

define RC232_RESPONDER_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(@D)/$(RC232_RESPONDER_SUBDIR)/rc232-responder.service $(TARGET_DIR)/etc/systemd/system/rc232-responder.service;
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
	ln -fs ../rc232-responder.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rc232-responder.service;
endef

$(eval $(python-package))

