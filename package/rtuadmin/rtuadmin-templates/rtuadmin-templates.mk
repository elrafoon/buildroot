RTUADMIN_TEMPLATES_VERSION = $(BR2_PACKAGE_RTUADMIN_VERSION)
RTUADMIN_TEMPLATES_SITE = ssh://gitolite@merlin/rtuadmin-templates
RTUADMIN_TEMPLATES_SITE_METHOD = git

$(eval $(cmake-package))
