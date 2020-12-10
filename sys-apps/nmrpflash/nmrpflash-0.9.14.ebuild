# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Tool for flashing Netgear firmware images to routers and compatible devices."
HOMEPAGE="https://github.com/jclehner/nmrpflash"
SRC_URI="https://github.com/jclehner/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
PATCHES="${FILESDIR}/${P}-prefix.patch"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="net-libs/libpcap
		dev-libs/libnl:3"
RDEPEND="${DEPEND}"
BDEPEND=""
