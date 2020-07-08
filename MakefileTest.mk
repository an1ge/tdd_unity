#This makefile makes the examples from the first few chapters with Unity test harness

#Set this to @ to keep the makefile quiet
SILENCE = @

#---- Outputs ----#
COMPONENT_NAME = Andi_TDD_Unity

#--- Inputs ----#
UNITY_HOME = unity.framework
CPP_PLATFORM = Gcc
PROJECT_HOME_DIR = led_driver
PROJECT_TEST_DIR = $(PROJECT_HOME_DIR)/test
CPP_PLATFORM = Gcc
UNITY_BUILD_HOME = unity.framework/extras/fixture/build
COMMON_CODE_DIR = my-common-code

UNITY_CFLAGS += -DUNITY_OUTPUT_CHAR=UnityOutputCharSpy_OutputChar
UNITY_WARNINGFLAGS = -Wall -Werror -Wswitch-default
#UNITY_WARNINGFLAGS += -Wshadow 

SRC_DIRS = \
	$(PROJECT_HOME_DIR)/src\
	$(PROJECT_HOME_DIR)/mocks

TEST_SRC_DIRS = \
	$(PROJECT_TEST_DIR)\
	$(UNITY_HOME)/unity\
	$(UNITY_HOME)/src\
    $(UNITY_HOME)/extras/fixture/src\
    $(UNITY_HOME)/extras/fixture/test\

MOCKS_SRC_DIRS = \
	$(PROJECT_TEST_DIR)/mocks\

INCLUDE_DIRS =\
  .\
  $(UNITY_HOME)/src\
  $(UNITY_HOME)/extras/fixture/src\
  $(UNITY_HOME)/extras/fixture/test\
  $(COMMON_CODE_DIR)/util\
  $(PROJECT_HOME_DIR)/include\
  $(PROJECT_HOME_DIR)/mocks\

all:
include $(UNITY_BUILD_HOME)/MakefileWorker.mk
