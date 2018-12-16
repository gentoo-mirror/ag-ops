# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd toolchain-funcs user

DESCRIPTION="torguard anonymous VPN - NOT related to TOR project"
HOMEPAGE="https://torguard.net"
SRC_URI="https://updates.torguard.biz/Software/Linux/torguard-latest-amd64-arch.tar.gz -> ${P}.tar.gz"

LICENSE="custom"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="sys-apps/iproute2"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}-v${PV}-amd64-arch

pkg_setup() {
	# enewgroup <name> [gid]
	enewgroup ${PN}
	# enewuser <user> [uid] [shell] [homedir] [groups]
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_unpack() {
	default
	cd "${S}" || die "Couldn't cd into the source directory ${S}"
	# tar xpf ${PN}-v${PV}-amd64-arch.tar || die "tar failed"
	tar xpf ${PN}-v${PV}-amd64-arch.tar || die "tar failed"
}

src_install() {
	fperms 0644 "${S}/${PN}-v${PV}-amd64-arch/*"
	fperms 0755 "${S}/${PN}-v${PV}-amd64-arch/opt/${PN}/bin/*"
	fperms 0644 "${S}/${PN}-v${PV}-amd64-arch/opt/${PN}/bin/*.conf"
	fperms 0644 "${S}/${PN}-v${PV}-amd64-arch/opt/${PN}/bin/*.desktop"
	cp -R "${S}/${PN}-v${PV}-amd64-arch/" "${D}/" || die "Install failed"
	# fperms 0644 *

}
