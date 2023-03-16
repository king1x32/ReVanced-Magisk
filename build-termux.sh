#!/usr/bin/env bash

set -e

pr() { echo -e "\033[0;32m[+] ${1}\033[0m"; }
ask() {
	local y
	for ((n = 0; n < 3; n++)); do
		pr "$1"
		if read -r y; then
			if [ "$y" = y ]; then
				return 0
			elif [ "$y" = n ]; then
				return 1
			fi
		fi
		pr "Asking again..."
	done
	return 1
}

if [ ! -f ~/.rvmm_"$(date '+%Y%m')" ]; then
	pr "Setting up environment..."
	yes "" | pkg update -y && pkg install -y openssl git wget jq openjdk-17 zip
	: >~/.rvmm_"$(date '+%Y%m')"
fi

if [ -f build.sh ]; then cd ..; fi
if [ -d ReVanced-Magisk ]; then
	pr "Checking for ReVanced-Magisk updates"
	git -C ReVanced-Magisk fetch
	if git -C ReVanced-Magisk status | grep -q 'is behind'; then
		pr "RaVanced-Magisk already is not synced with upstream."
		pr "Cloning ReVanced-Magisk. config.toml will be preserved."
		cp -f ReVanced-Magisk/config.toml .
		rm -rf ReVanced-Magisk
		git clone https://github.com/Kingsmanvn-Official/ReVanced-Magisk --recurse --depth 1
		mv -f config.toml ReVanced-Magisk/config.toml
	fi
else
	pr "Cloning ReVanced-Magisk."
	git clone https://github.com/Kingsmanvn-Official/ReVanced-Magisk --recurse --depth 1
	sed -i '/^enabled.*/d; /^\[.*\]/a enabled = false' ReVanced-Magisk/config.toml
fi
cd ReVanced-Magisk
chmod +x build.sh build-termux.sh

if ask "Do you want to open the config.toml for customizations? [y/n]"; then
	nano config.toml
fi
if ! ask "Setup is done. Do you want to start building? [y/n]"; then
	exit 0
fi
./build.sh

cd build
pr "Ask for storage permission"
until
	yes | termux-setup-storage >/dev/null 2>&1
	ls /sdcard >/dev/null 2>&1
do
	sleep 1
done

PWD=$(pwd)
mkdir -p ~/storage/downloads/ReVanced-Magisk
for op in *; do
	[ "$op" = "*" ] && continue
	mv -f "${PWD}/${op}" ~/storage/downloads/revanced-magisk-module/"${op}"
done

pr "Outputs are available in /sdcard/Download/ReVanced-Magisk folder"
am start -a android.intent.action.VIEW -d file:///sdcard/Download/ReVanced-Magisk -t resource/folder
sleep 2
am start -a android.intent.action.VIEW -d file:///sdcard/Download/ReVanced-Magisk -t resource/folder
