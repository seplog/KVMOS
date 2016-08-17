################################################################################
#      This file is part of KVMOS - @page@
#      Copyright (C) 2016 KVMOS
#
#  KVMOS is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  KVMOS is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with KVMOS.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="qemu"
PKG_VERSION="2.6.0"
PKG_REV="1"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="http://www.qemu.org"
PKG_URL="http://wiki.qemu.org/download/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL2 curl libgcrypt bzip2 lzo libepoxy mesa libpng libjpeg-turbo gtk+ adwaita-icon-theme bluez spice virglrenderer libusb util-linux usbredir libaio"
PKG_PRIORITY="optional"
PKG_SECTION="virtualization"
PKG_SHORTDESC="QEMU + Kernel-based Virtual Machine userland tools"
PKG_LONGDESC="QEMU + Kernel-based Virtual Machine userland tools"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

TARGET_CONFIGURE_OPTS="--prefix=/usr \
                       --bindir=/usr/bin \
                       --sbindir=/usr/sbin \
                       --sysconfdir=/etc \
                       --libexecdir=/usr/lib \
                       --localstatedir=/var"

PKG_CONFIGURE_OPTS_TARGET="--disable-bsd-user \
                           --disable-guest-agent \
                           --disable-strip \
                           --disable-werror \
                           --enable-gcrypt \
                           --disable-debug-info \
                           --disable-debug-tcg \
                           --disable-docs \
                           --disable-tcg-interpreter \
                           --enable-attr \
                           --disable-brlapi \
                           --enable-linux-aio \
                           --enable-bluez \
                           --disable-cap-ng \
                           --enable-curl \
                           --enable-fdt \
                           --disable-glusterfs \
                           --disable-gnutls \
                           --disable-nettle \
                           --enable-gtk \
                           --disable-rdma \
                           --disable-libiscsi \
                           --enable-vnc-jpeg \
                           --enable-kvm \
                           --enable-lzo \
                           --enable-bzip2 \
                           --disable-curses \
                           --disable-libnfs \
                           --disable-numa \
                           --enable-opengl \
                           --enable-vnc-png \
                           --disable-rbd \
                           --disable-vnc-sasl \
                           --enable-sdl \
                           --disable-seccomp \
                           --disable-smartcard \
                           --disable-snappy \
                           --enable-spice \
                           --disable-libssh2 \
                           --enable-libusb \
                           --enable-usb-redir \
                           --enable-uuid \
                           --disable-vde \
                           --enable-vhost-net \
                           --enable-virglrenderer \
                           --enable-virtfs \
                           --enable-vnc \
                           --disable-vte \
                           --disable-xen \
                           --disable-xen-pci-passthrough \
                           --disable-xfsctl \
                           --disable-linux-user \
                           --enable-system \
                           --with-system-pixman \
                           --audio-drv-list=sdl,alsa \
                           --with-gtkabi=3.0 \
                           --with-sdlabi=2.0 \
                           --target-list=x86_64-softmmu"

export CXXFLAGS="$CXXFLAGS -I$SYSROOT_PREFIX/usr/include"
export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include -I$SYSROOT_PREFIX/usr/include/SDL2"
export LDFLAGS="$LDFLAGS -I$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/usr/lib -lbz2 -lSDL2 -lbluetooth"

post_install_target() {
  mkdir -p $INSTALL/usr/config/sysctl.d
  cp $PKG_DIR/config/hugepages.conf $INSTALL/usr/config/sysctl.d

  mkdir -p $INSTALL/usr/config/qemu
  ln -sf /storage/.config/qemu $INSTALL/etc/qemu
}
