################################################################################
#
# Turtle
#
################################################################################

TURTLE_VERSION:=0.1.1
TURTLE_SITE = $(TOPDIR)/../dist/turtle
TURTLE_SITE_METHOD = local
TURTLE_LICENSE = MIT
TURTLE_DEPENDENCIES += boost zeromq protobuf protobuf-c
TURTLE_INSTALL_TARGET = YES

$(eval $(cmake-package))
