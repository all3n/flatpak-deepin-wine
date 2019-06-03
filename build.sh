#! /bin/sh
#
# build.sh
# Copyright (C) 2019 wanghuacheng <wanghuacheng@wanghuacheng-PC>
#
# Distributed under terms of the MIT license.
#



TARGET_DIR=target
rm -rf $TARGET_DIR
mkdir $TARGET_DIR
pushd $TARGET_DIR
PAG_VERSION=2.18.18

echo "build "

flatpak-builder --repo=repo --arch=i386 build ../com.deepin.wine.json
#flatpak remote-add --user --no-gpg-verify repodeepinwine ./repo
#flatpak install --user repodeepinwine com.deepin.wine.Platform
echo "start build bundle flatpak"
flatpak build-bundle repo com.deepin.wine.Platform-$PKG_VERSION.flatpak \
    com.deepin.wine.Platform --arch=i386 $PKG_VERSION --runtime

popd
