#! /bin/sh
#
# download.sh
# Copyright (C) 2019 wanghuacheng <wanghuacheng@wanghuacheng-PC>
#
# Distributed under terms of the MIT license.
#

bin=`dirname "$0"`
export APP_DIR=`cd "$bin/"; pwd`

download_wine_pkgs(){
    local PKG_DIR=$1
    PACKAGE_URL_BASE=http://mirrors.ustc.edu.cn/deepin/pool/non-free/d/deepin-wine/
    PKGS=`curl -s $PACKAGE_URL_BASE|grep -v '\.\./'|grep href|awk -F'"' '{print $2}'|grep -v rc2`
    for i in ${PKGS[@]};do
        echo "DOWNLOAD $i"
        wget -q -O $PKG_DIR/$i $PACKAGE_URL_BASE/$i
    done
}

download_wine_pkgs $APP_DIR
sha256sum ./*.deb > sha256sum.txt

