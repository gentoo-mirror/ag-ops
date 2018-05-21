# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

DESCRIPTION="Optional kernel module for sys-process/atop to gather statistics about TCP/UDP packets transmitted/received per process and per thread"
HOMEPAGE="http://www.atoptool.nl/netatop.php"
SRC_URI="http://www.atoptool.nl/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
PATCHES="${FILESDIR}/netatop-karch.patch"

CHOST_amd64=x86_64-unknown-linux-gnu
CHOST_x86=i686-unknown-linux-gnu

src_prepare() {
	# dodir /lib/modules/$(uname -r)/extra;
	sed -i 's/extra/misc/' Makefile || die "sed expression failed"
	default_src_prepare
	eapply_user
}

src_install() {
	# dolib module/netatop.ko
	default
}
