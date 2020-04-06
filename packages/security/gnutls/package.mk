# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gnutls"
PKG_VERSION="3.6.10"
PKG_SHA256="b1f3ca67673b05b746a961acf2243eaae0ffe658b6a6494265c648e7c7812293"
PKG_LICENSE="LGPL2.1"
PKG_SITE="https://gnutls.org"
PKG_URL="https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libidn2 nettle zlib"
PKG_LONGDESC="A library which provides a secure layer over a reliable transport layer."

PKG_CONFIGURE_OPTS_TARGET="--with-sysroot=$SYSROOT_PREFIX/usr \
                           --with-libz-prefix=$SYSROOT_PREFIX/usr \
                           --with-librt-prefix=$SYSROOT_PREFIX/usr \
                           --with-libpthread-prefix=$SYSROOT_PREFIX/usr \
                           --without-libiconv-prefix \
                           --without-libintl-prefix \
                           --disable-libdane \
                           --disable-tests \
                           --disable-tools \
                           --enable-hardware-acceleration \
                           --disable-openssl-compatibility \
                           --disable-cxx \
                           --without-p11-kit \
                           --enable-local-libopts \
                           --with-included-libtasn1 \
                           --disable-doc \
                           --disable-nls \
                           --disable-guile \
                           --disable-full-test-suite \
                           --disable-valgrind-tests \
                           --without-lzo \
                           --with-gnu-ld \
                           --with-included-unistring"
