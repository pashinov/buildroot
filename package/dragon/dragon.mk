################################################################################
#
# Dragon
#
################################################################################

DRAGON_VERSION:=0.0.1
DRAGON_SITE = $(TOPDIR)/../dist/dragon
DRAGON_SITE_METHOD = local
DRAGON_LICENSE = MIT
DRAGON_DEPENDENCIES += boost zeromq openssl protobuf protobuf-c libcpprestsdk
DRAGON_INSTALL_TARGET = YES

$(eval $(cmake-package))
