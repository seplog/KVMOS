# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="network"
PKG_VERSION=""
PKG_LICENSE="various"
PKG_SITE="http://www.openelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain netbase ethtool openssh "
PKG_PRIORITY="optional"
PKG_SECTION="virtual"
PKG_LONGDESC="Metapackage for various packages to install network support"

if [ "$DISTRO" = "KVMOS" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET netctl"
else
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET connman"
fi

if [ "$BLUETOOTH_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bluez"
fi

if [ "$SAMBA_SERVER" = "yes" ] || [ "$SAMBA_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET samba"
fi

if [ "$OPENVPN_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET openvpn"
fi

if [ "$WIREGUARD_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET wireguard-tools wireguard-linux-compat"
fi

# nss needed by inputstream.adaptive, chromium etc.
if [ "$TARGET_ARCH" = "x86_64" ] || [ "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET nss"
fi
