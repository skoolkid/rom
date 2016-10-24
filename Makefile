MK = $(SKOOLKIT_HOME)/tools/disassembly.mk
ifeq ($(wildcard $(MK)),)
    $(error $(MK): file not found)
endif
include $(MK)

SNAPSHOT = $(BUILD)/rom+sysvars.bin

.PHONY: snapshot
snapshot:
	mkdir -p $(BUILD)
	cp /usr/share/spectrum-roms/48.rom $(SNAPSHOT)
	$(SKOOLKIT_HOME)/skool2bin.py -S 16384 sources/rom.skool - >> $(SNAPSHOT)

.PHONY: _targets
_targets:
	@echo "  snapshot  create $(SNAPSHOT)"
