################################################################################
#
# Lion
#
################################################################################

LION_VERSION = 0.1.1
LION_SITE = $(TOPDIR)/../dist/lion
LION_SITE_METHOD = local
LION_LICENSE = MIT

LION_DEPENDENCIES = host-rustc zeromq protobuf protobuf-c

LION_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
LION_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)

LION_CARGO_OPTS = \
	--$(LION_CARGO_MODE) \
	--target=$(RUSTC_TARGET_NAME) \
	--manifest-path=$(@D)/Cargo.toml


define LION_CONFIGURE_CMDS
	ln -s $(HOST_DIR)/bin/arm-buildroot-linux-gnueabihf-gcc $(HOST_DIR)/bin/arm-linux-gnueabihf-gcc
 	ln -s $(HOST_DIR)/bin/arm-buildroot-linux-gnueabihf-gcc.br_real $(HOST_DIR)/bin/arm-linux-gnueabihf-gcc.br_real
endef

define LION_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(LION_CARGO_ENV) \
		PKG_CONFIG_ALLOW_CROSS=1 cargo build $(LION_CARGO_OPTS)
endef

define LION_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/target/$(RUSTC_TARGET_NAME)/$(LION_CARGO_MODE)/lion $(TARGET_DIR)/usr/bin/lion
	$(INSTALL) -D $(@D)/etc/config.json $(TARGET_DIR)/usr/etc/lion/config.json
endef

$(eval $(generic-package))
