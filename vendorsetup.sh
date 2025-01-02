#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="dada"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export LC_ALL="C"
 	export ALLOW_MISSING_DEPENDENCIES=true
	
	# "dada" Specific
	export FOX_AB_DEVICE=1
	export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
	export OF_RECOVERY_AB_FULL_REFLASH_RAMDISK=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_VENDOR_BOOT_RECOVERY=1
	export FOX_RECOVERY_VENDOR_BOOT_PARTITION="/dev/block/platform/soc/1d84000.ufshc/by-name/vendor_boot"
	export OF_USE_LZ4_COMPRESSION=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_LZ4_BINARY=1
	export FOX_USE_ZSTD_BINARY=1
	export FOX_USE_RESETPROP_BINARY=1
	export OF_SKIP_FBE_DECRYPTION=1
	export OF_NO_MIUI_OTA_VENDOR_BACKUP=1
	export OF_NO_RELOAD_AFTER_DECRYPTION=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export FOX_DELETE_AROMAFM=1
	export OF_USE_HEXDUMP=1
	export OF_USE_GREEN_LED=0
	export OF_FLASHLIGHT_ENABLE=0
	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
	export OF_PATCH_AVB20=1
	export OF_SUPPORT_VBMETA_AVB2_PATCHING=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
	export OF_QUICK_BACKUP_LIST="/boot;/super;/vendor_boot;/persist;/recovery;"
	export FOX_USE_GREP_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_NANO_EDITOR=1
	export OF_FORCE_PREBUILT_KERNEL=1
	export OF_ENABLE_LPTOOLS=1
	export FOX_PATCH_VBMETA_FLAG=1
	export FOX_VIRTUAL_AB_DEVICE=1
	export OF_DYNAMIC_FULL_SIZE=11811160064
	export OF_DEFAULT_TIMEZONE="TAIST-8;TAIDT"
	export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1
	export OF_DISPLAY_FORMAT_FILESYSTEMS_DEBUG_INFO=1
	export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
 
  # R12.1 Settings
	export FOX_VERSION="R12.1"
	export FOX_VARIANT="HyperOS2"
	export FOX_BUILD_TYPE="Unofficial"
	export OF_MAINTAINER="Adontoo"
	export OF_MAINTAINER_AVATAR="/tmp/misc/Adontoo.jpg"
	export OF_MAGISK="/tmp/misc/Magisk-v28.1.zip"
	export FOX_USE_SPECIFIC_MAGISK_ZIP=/tmp/misc/Magisk-v28.1.zip

	# Screen Settings
	export OF_SCREEN_H=2400
	export OF_STATUS_H=104
	export OF_STATUS_INDENT_LEFT=85
	export OF_STATUS_INDENT_RIGHT=85
	export OF_HIDE_NOTCH=1
	export OF_ALLOW_DISABLE_NAVBAR=0

	# Avatar Settings
    if [ -n "$OF_MAINTAINER_AVATAR" ]; then
        if [ ! -f "$OF_MAINTAINER_AVATAR" ]; then
              # some colour codes
              RED='\033[0;31m'
              GREEN='\033[0;32m'
              ORANGE='\033[0;33m'
              BLUE='\033[0;34m'
              PURPLE='\033[0;35m'
              echo -e "${RED}-- File \"$OF_MAINTAINER_AVATAR\" not found  ...${NC}"
              echo -e "${ORANGE}-- Downloading...${NC}"
              mkdir -p /tmp/misc
              wget -O /tmp/misc/Adontoo.jpg https://github.com/adontoo/pixelos_manifest/blob/icon/snippets/icon.jpg?raw=true
              echo -e "${BLUE}-- Successfully Downloaded the Avatar Image \"$OF_MAINTAINER_AVATAR\" ...${NC}"
              echo -e "${PURPLE}-- Using A Custom Maintainer Avatar from the Downloaded Image \"$OF_MAINTAINER_AVATAR\" ...${NC}"
              echo -e "${GREEN}-- Done!"
        fi
    fi
    
	# Check if Magisk.zip exist。
    if [ -n "$FOX_USE_SPECIFIC_MAGISK_ZIP" ]; then
    	if [ ! -f "$OF_MAGISK" ]; then
              # some colour codes
              RED='\033[0;31m'
              GREEN='\033[0;32m'
              ORANGE='\033[0;33m'
              BLUE='\033[0;34m'
              PURPLE='\033[0;35m'
              echo -e "${RED}-- File \"$OF_MAGISK\" not found  ...${NC}"
              echo -e "${ORANGE}-- Downloading...${NC}"
              wget -O /tmp/misc/Magisk-v28.1.zip https://github.com/topjohnwu/Magisk/releases/download/v28.1/Magisk-v28.1.apk
              echo -e "${BLUE}-- Successfully Downloaded the Magisk.zip File \"$OF_MAGISK\" ...${NC}"
              echo -e "${PURPLE}-- Using A Custom Magisk.zip from the Downloaded file \"$OF_MAGISK\" ...${NC}"
              echo -e "${GREEN}-- Done!"
     	fi
    fi

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
