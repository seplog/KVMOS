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

PKG_NAME="libvirt"
PKG_VERSION="1.3.3.2"
PKG_REV="1"
PKG_ARCH="x86_64"
PKG_LICENSE="LGPL-2.1"
PKG_SITE="http://www.libvirt.org/"
PKG_URL="http://libvirt.org/sources/stable_updates/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libgcrypt libnl libxml2 curl dmidecode util-linux gettext readline fuse LVM2 parted libpcap qemu systemd iptables iproute2 libpciaccess yajl pm-utils ebtables dnsmasq libressl nc6" # scrub netcat ncurses radvd ( libssh >= 1.3 ) (libsystemd-daemon? o0)
PKG_PRIORITY="optional"
PKG_SECTION="virtualization"
PKG_SHORTDESC="C toolkit to manipulate virtual machines"
PKG_LONGDESC="C toolkit to manipulate virtual machines"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_path_ADDR2LINE=/usr/bin/addr2line \
                           ac_cv_path_AUGPARSE=/usr/bin/augparse \
                           ac_cv_path_DMIDECODE=/usr/sbin/dmidecode \
                           ac_cv_path_DMSETUP=/usr/sbin/dmsetup \
                           ac_cv_path_DNSMASQ=/usr/sbin/dnsmasq \
                           ac_cv_path_EBTABLES_PATH=/usr/sbin/ebtables \
                           ac_cv_path_GMSGFMT=/usr/bin/gmsgfmt \
                           ac_cv_path_GREP=/bin/grep \
                           ac_cv_path_IFCONFIG_PATH=/sbin/ifconfig \
                           ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
                           ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
                           ac_cv_path_IP_PATH=/sbin/ip \
                           ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
                           ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
                           ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
                           ac_cv_path_LVS=/usr/sbin/lvs \
                           ac_cv_path_MODPROBE=/sbin/modprobe \
                           ac_cv_path_MOUNT=/bin/mount \
                           ac_cv_path_MSGFMT=/usr/bin/msgfmt \
                           ac_cv_path_MSGMERGE=/usr/bin/msgmerge \
                           ac_cv_path_PARTED=/usr/sbin/parted \
                           ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
                           ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
                           ac_cv_path_PVS=/usr/sbin/pvs \
                           ac_cv_path_PYTHON=/usr/bin/python \
                           ac_cv_path_RADVD=/usr/sbin/radvd \
                           ac_cv_path_RMMOD=/sbin/rmmod \
                           ac_cv_path_SED=/bin/sed \
                           ac_cv_path_UDEVADM=/usr/bin/udevadm \
                           ac_cv_path_UMOUNT=/bin/umount \
                           ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
                           ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
                           ac_cv_path_VGREMOVE=/usr/sbin/vgmove \
                           ac_cv_path_VGS=/usr/sbin/vgs \
                           ac_cv_path_VGSCAN=/usr/sbin/vgscan \
                           ac_cv_path_XGETTEXT=/usr/bin/xgettext \
                           --without-apparmor \
                           --without-apparmor-mount \
                           --without-attr \
                           --without-audit \
                           --without-avahi \
                           --with-blkid \
                           --without-capng \
                           --with-curl \
                           --without-dbus \
                           --with-fuse \
                           --with-gcrypt \
                           --without-glusterfs \
                           --without-hal \
                           --without-netcf \
                           --without-numactl \
                           --without-openwsman \
                           --with-pciaccess \
                           --with-readline \
                           --without-sanlock \
                           --without-sasl \
                           --without-selinux \
                           --without-selinux-mount \
                           --without-ssh2 \
                           --without-systemd-daemon \
                           --with-udev \
                           --without-wireshark-dissector \
                           --without-ws-plugindir \
                           --without-nss-plugin \
                           --with-yajl \
                           --without-xen \
                           --without-xen-inotify \
                           --with-qemu \
                           --without-uml \
                           --without-openvz \
                           --without-vmware \
                           --without-phyp \
                           --without-xenapi \
                           --without-libxl \
                           --without-vbox \
                           --without-lxc \
                           --with-esx \
                           --without-hyperv \
                           --without-test \
                           --with-remote \
                           --with-libvirtd \
                           --with-chrdev-lock-files \
                           --with-pm-utils \
                           --with-init-script=systemd \
                           --with-sysctl \
                           --without-rhel5-api \
                           --without-login-shell \
                           --without-vz \
                           --without-bhyve \
                           --with-libxml=$SYSROOT_PREFIX/usr \
                           --without-gnutls \
                           --without-polkit \
                           --without-firewalld \
                           --without-secdriver-selinux \
                           --without-secdriver-apparmor \
                           --without-apparmor-profiles \
                           --without-dtrace \
                           --without-numad \
                           --without-libpcap \
                           --with-network \
                           --with-secrets \
                           --with-storage-dir \
                           --with-storage-fs \
                           --with-storage-lvm \
                           --without-storage-iscsi \
                           --without-storage-scsi \
                           --without-storage-mpath \
                           --with-storage-disk \
                           --without-storage-rbd \
                           --without-storage-sheepdog \
                           --without-storage-gluster \
                           --without-storage-zfs \
                           --without-test-suite \
                           --without-libiconv-prefix \
                           --without-libintl-prefix \
                           --with-driver-modules \
                           --with-interface \
                           --with-qemu-user=root \
                           --with-qemu-group=root \
                           --with-macvtap"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/

  cp $INSTALL/etc/libvirt $INSTALL/usr/config/ -Rf
  rm -Rf $INSTALL/etc/libvirt
  ln -sf /storage/.config/libvirt $INSTALL/etc/

  cp $INSTALL/etc/sysconfig $INSTALL/usr/config/ -Rf
  rm -Rf $INSTALL/etc/sysconfig
  ln -sf /storage/.config/sysconfig $INSTALL/etc/

  # Copy dmidecode... It is only a plugin
  mkdir -p $INSTALL/usr/sbin
  cp -P $(get_build_dir dmidecode)/biosdecode $INSTALL/usr/sbin/
  cp -P $(get_build_dir dmidecode)/dmidecode $INSTALL/usr/sbin/
  cp -P $(get_build_dir dmidecode)/ownership $INSTALL/usr/sbin/
  cp -P $(get_build_dir dmidecode)/vpddecode $INSTALL/usr/sbin/
}
