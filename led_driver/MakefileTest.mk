PROJECT = led_driver_test
BUILD_DIR = bin/test

SRC_DIR = src
UNITY_HOME = ../unity.framework
TEST_DIR = test
MOCK_DIR = mocks
UNITY_SRC = $(UNITY_HOME)/src
SHARED_DIR = ../my-common-code
CFILES = $(SRC_DIR)/led_driver.c\
	$(TEST_DIR)/all_tests.c\
	$(TEST_DIR)/led_driver_test.c\
	$(TEST_DIR)/led_driver_test_runner.c\
	$(MOCK_DIR)/runtime_error_stub.c\
	$(UNITY_SRC)/unity.c\
	$(UNITY_HOME)/extras/fixture/src/unity_fixture.c

#CFILES += api.c
#AFILES += api-asm.S

# TODO - you will need to edit these two lines!
DEVICE=stm32l475vgt6
OOCD_FILE = board/stm32l4discovery.cfg

# You shouldn't have to edit anything below here.
VPATH += $(SHARED_DIR)
INCLUDES += $(patsubst %,-I%, . $(SHARED_DIR))\
	$(patsubst %,-I%, . $(SHARED_DIR)/util)\
	-Iinclude\
	-I$(UNITY_SRC)\
	-I$(UNITY_HOME)/extras/fixture/src\
	-I$(MOCK_DIR)
OPENCM3_DIR=../libopencm3

include $(OPENCM3_DIR)/mk/genlink-config.mk
include ../rules.mk
include $(OPENCM3_DIR)/mk/genlink-rules.mk
