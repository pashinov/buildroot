################################################################################
#
# Phoenix
#
################################################################################

PHOENIX_VERSION = 0.0.1
PHOENIX_SITE = $(TOPDIR)/../dist/phoenix
PHOENIX_SITE_METHOD = local
PHOENIX_LICENSE = MIT

PHOENIX_DEPENDENCIES = host-rustc zeromq openssl protobuf protobuf-c paho-mqtt-c

PHOENIX_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
PHOENIX_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)

PHOENIX_CARGO_OPTS = \
	--$(PHOENIX_CARGO_MODE) \
	--target=$(RUSTC_TARGET_NAME) \
	--manifest-path=$(@D)/Cargo.toml


define PHOENIX_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(PHOENIX_CARGO_ENV) \
		PKG_CONFIG_ALLOW_CROSS=1 cargo build $(PHOENIX_CARGO_OPTS)
endef

define PHOENIX_INSTALL_TARGET_CMDS
	$(INSTALL) -D \
		$(@D)/target/$(RUSTC_TARGET_NAME)/$(PHOENIX_CARGO_MODE)/phoenix \
		$(TARGET_DIR)/usr/bin/phoenix
endef

$(eval $(generic-package))
