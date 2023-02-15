#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/universal8890-common

ifneq ($(filter herolte hero2lte gracelte graceltekor gracerlte gracerltekor, $(TARGET_DEVICE)),)

  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

endif

# install symlinks for vendor libs
include $(CLEAR_VARS)

ifneq ($(filter herolte, $(TARGET_DEVICE)),)
VENDOR_OUT_PATH := out/target/product/herolte/vendor
endif

ifneq ($(filter hero2lte, $(TARGET_DEVICE)),)
VENDOR_OUT_PATH := out/target/product/hero2lte/vendor
endif

LOCAL_MODULE := symlinks-universal8890-common
LOCAL_SRC_FILES := symlinks
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(VENDOR_OUT_PATH)
LOCAL_MODULE_TAGS := optional
LOCAL_POST_INSTALL_CMD := echo creating symlinks to $(VENDOR_OUT_PATH) ;\
  ln -sf libprotobuf-cpp-lite-3.9.1.so $(VENDOR_OUT_PATH)/lib/libprotobuf-cpp-lite.so ;\
  ln -sf libprotobuf-cpp-lite-3.9.1.so $(VENDOR_OUT_PATH)/lib64/libprotobuf-cpp-lite.so
include $(BUILD_PREBUILT)
