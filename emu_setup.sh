#!/bin/bash

sudo usermod -a -G kvm $USER
sudo apt update
sudo apt install openjdk-8-jre qemu-system-x86

SDK_DIR="$HOME/Android/Sdk"

cd $HOME

if [ ! -d "Android" ]; then
	mkdir Android
	mkdir Android/Sdk
elif [ ! -d "Android/Sdk" ]; then
	mkdir Android/Sdk
fi

if [ ! -d ".android" ]; then
	mkdir .android
	touch .android/repositories.cfg
elif [ ! -f ".android/repositories.cfg" ]; then
	touch .android/repositories.cfg
fi

cd Android/Sdk

# Download Android Sdk
wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip -o sdk-tools-linux-4333796.zip
rm sdk-tools-linux-4333796.zip
# Downlaod Andoird platform tool
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip -o platform-tools-latest-linux.zip
rm platform-tools-latest-linux.zip

# Setup sdk
yes "y" | ./tools/bin/sdkmanager --install 'ndk;20.0.5594570'
yes "y" | ./tools/bin/sdkmanager 'platforms;android-29'
yes "y" | ./tools/bin/sdkmanager 'system-images;android-29;default;x86_64'
# Set AVD
yes "" | ./tools/bin/avdmanager create avd -k 'system-images;android-29;default;x86_64' -n w4118_emu

