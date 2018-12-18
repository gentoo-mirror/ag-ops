# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd toolchain-funcs user

DESCRIPTION="torguard anonymous VPN - NOT related to TOR project"
HOMEPAGE="https://torguard.net"
SRC_URI="https://updates.torguard.biz/Software/Linux/torguard-latest-amd64-arch.tar.gz -> ${P}.tar.gz
		x86?	( https://updates.torguard.biz/Software/Linux/torguard-latest-i386-arch.tar.gz -> ${P}.tar.gz )"

LICENSE="custom"
SLOT="0"
# KEYWORDS="~amd64 ~x86"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="sys-apps/iproute2
		net-vpn/openvpn"
DEPEND="${RDEPEND}"

# S=${WORKDIR}/${PN}-v${PV}-amd64-arch
S="${WORKDIR}/${PN}-v${PV}-amd64-arch/${PN}-v${PV}-amd64-arch"
# S=${WORKDIR}/${PN}-v${PV}-amd64-arch

pkg_setup() {
	# enewgroup <name> [gid]
	enewgroup ${PN}
	# enewuser <user> [uid] [shell] [homedir] [groups]
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_unpack() {
	default
	# cd "${S}" || die "Couldn't cd into the source directory ${S}"
	cd "${WORKDIR}/${PN}-v${PV}-amd64-arch" || die "Couldn't cd into the source directory ${S}"
	# TODO: fix x86 installation :(
	# tar xpf ${PN}-v${PV}-amd64-arch.tar || die "tar failed"
	unpack ./${PN}-v${PV}-amd64-arch.tar || die "tar failed"
}

src_install() {
	# doins -r .
	# fperms 0644 "${S}/${PN}-v${PV}-amd64-arch/"
	# fperms 0755 "${D}/opt/${PN}/"
	# fperms 0644 "${D}/"
	# fperms 0644 "${S}/${PN}-v${PV}-amd64-arch/opt/${PN}/bin/*.conf"
	# fperms 0644 "${S}/${PN}-v${PV}-amd64-arch/opt/${PN}/bin/*.desktop"
	# fperms 0644 *
	# fperms 0644 ${EROOT}
	# fperms 0644 ${EROOT}/etc/sudoers.d/${PN}

	# doins -r "${S}/usr/share" "${ED}/usr"
	doins -r "${S}/usr"

	insinto /opt/${PN}/bin/
	doins -r "${S}/opt/${PN}/bin/${PN}"
	doins "${S}/opt/${PN}/bin/openconnect"
	doins "${S}/opt/${PN}/bin/vpnc-script"

	# torguard sysusers conf
	insinto /usr/lib/sysusers.d
	newins "${FILESDIR}/${PN}.sysusers" "${PN}.conf"

	# Let's use the system implementation of openvpn
	dosym "/usr/sbin/openvpn" "${EROOT}/opt/${PN}/bin/openvpn_v2_4"

}
