SNAPSHOT = $(shell grep -Po 'SNAPSHOT=\$$ROM_DISASSEMBLY_HOME/\K.*' .ddiffsrc)
SNAPSHOT_CMD = mkdir -p build && cp $(SKOOLKIT_HOME)/skoolkit/resources/48.rom $(SNAPSHOT) && $(SKOOLKIT_HOME)/skool2bin.py -S 16384 sources/rom.skool - >> $(SNAPSHOT)

MK = $(SKOOLKIT_HOME)/tools/disassembly.mk
ifeq ($(wildcard $(MK)),)
    $(error $(MK): file not found)
endif
include $(MK)
