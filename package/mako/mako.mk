# Verify mako-templates is installed
# DOES NOT INSTALL ANYTHING!!!

MAKO_VERSION = 0.8.0
MAKO_SOURCE = Mako-$(MAKO_VERSION).tar.gz
MAKO_SITE = http://www.makotemplates.org/downloads

define HOST_MAKO_BUILD_CMDS
	(which mako-render)
endef

$(eval $(host-generic-package))

