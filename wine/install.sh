#!/bin/bash
bin=`dirname "$0"`
export APP_DIR=`cd "$bin/"; pwd`

unpack_deb(){
    local DEB_FILE=$1
    local DEB_FILE_NAME=`basename $DEB_FILE`
    local DEB_UNPACK_DIR=pkgs/${DEB_FILE_NAME%.*}
    mkdir -p $DEB_UNPACK_DIR
    pushd $DEB_UNPACK_DIR
    ar x $DEB_FILE
    tar -Jxvf data.tar.xz
    if [[ -d usr ]];then
        cp -f usr / -r
    fi
    popd
    rm -rf $DEB_UNPACK_DIR
}
unpack_txz(){
    local PKG_FILE=$1
    local PKG_FILE_NAME=`basename $DEB_FILE`
    local PKG_UNPACK_DIR=pkgs/${DEB_FILE_NAME%.*}
    mkdir -p $PKG_UNPACK_DIR
    pushd $PKG_UNPACK_DIR
    tar -Jxvf $PKG_FILE
    if [[ -d usr ]];then
        cp -f usr / -r
    fi
    popd
    rm -rf $PKG_UNPACK_DIR
}


for DEB_FILE in `ls $APP_DIR/*.deb`;do
    echo "unpack $DEB_FILE"
    unpack_deb $DEB_FILE
done
unpack_txz $APP_DIR/udis86-1.7.2-i586-1_slonly.txz
ln -s /usr/lib/libudis86.so.0.0.0 /usr/lib/libudis86.so.0

