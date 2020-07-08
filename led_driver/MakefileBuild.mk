PROJECT = led_driver
BUILD_DIR = bin

SRC_DIR = src
SHARED_DIR = ../my-common-code
CFILES = $(SRC_DIR)/main.c\
	$(SRC_DIR)/led_driver.c
#CFILES += api.c
#AFILES += api-asm.S

# TODO - you will need to edit these two lines!
DEVICE=stm32l475vgt6
OOCD_FILE = board/stm32l4discovery.cfg

# You shouldn't have to edit anything below here.
VPATH += $(SHARED_DIR)
INCLUDES += $(patsubst %,-I%, . $(SHARED_DIR))\
	$(patsubst %,-I%, . $(SHARED_DIR)/util)\
	-Iinclude/
OPENCM3_DIR=../libopencm3

include $(OPENCM3_DIR)/mk/genlink-config.mk
include ../rules.mk
include $(OPENCM3_DIR)/mk/genlink-rules.mk
