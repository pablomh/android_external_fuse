# Copyright (C) 2017 The Android Open Source Project
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
LOCAL_PATH := $(call my-dir)

common_src_files := \
	../android/statvfs.c \
	buffer.c \
	cuse_lowlevel.c \
	fuse.c \
	fuse_loop.c \
	fuse_loop_mt.c \
	fuse_lowlevel.c \
	fuse_opt.c \
	fuse_signals.c \
	helper.c \
	mount.c \
	mount_util.c

common_c_includes := \
	external/libfuse/android \
	external/libfuse/include

common_shared_libraries := \
	libutils

common_cflags := \
	-D_FILE_OFFSET_BITS=64 \
	-D_LARGEFILE_SOURCE \
	-D_REENTRANT \
	-DFUSE_USE_VERSION=30 \
	-DFUSERMOUNT_DIR=\"/system/xbin\" \
	-fno-strict-aliasing \
	-fPIC

common_ldflags := \
	-Wl,--version-script,$(LOCAL_PATH)/fuse_versionscript

include $(CLEAR_VARS)
LOCAL_MODULE := libfuse
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := $(common_shared_libraries)
LOCAL_CFLAGS := $(common_cflags)
LOCAL_LDFLAGS := $(common_ldflags)
LOCAL_CLANG := true
include $(BUILD_SHARED_LIBRARY)
