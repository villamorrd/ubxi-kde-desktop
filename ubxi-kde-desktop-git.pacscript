pkgname="ubxi-kde-desktop-git"
arch=("amd64" "arm64")
pkgver="0.0.1"
source=("https://github.com/villamorrd/ubxi-kde-desktop.git#branch=develop")
depends=("plasma-desktop" "konsole" "systemsettings" "plasma-nm" "plasma-disks"
  "plasma-firewall" "plasma-pa" "plasma-systemmonitor" "kinfocenter" "kmenuedit"
  "kscreen" "dolphin" "kde-config-gtk-style" "kde-config-screenlocker" "breeze-gtk-theme"
  "xdg-desktop-portal-gtk" "xdg-desktop-portal-kde")
pacdeps=("rhino-ubxi-core" "unicons-git")
optdeps=(
  "kde-spectacle: a simple application for capturing desktop screenshots"
  "ark: File archiver by KDE"
)
gives="ubxi-kde-desktop"
replaces=("unicorn-desktop")
priority='required'
pkgdesc="UBXI KDE Plasma Desktop"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
incompatible=('debian:*')
license=('GPL-3.0-or-later')

build() {
    cd "${gives}"
    mkdir -p "${pkgdir}/usr/share/icons"
    mkdir -p "${pkgdir}/usr/share/wallpapers"
    mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel"
    mkdir -p "${pkgdir}/etc/xdg"
}

package() {
  cd "${gives}"
  # Icons
  install -Dm644 "rhino/logos/logo.png" -t "${pkgdir}/usr/share/icons"
  install -Dm644 "rhino/logos/logo.svg" -t "${pkgdir}/usr/share/icons"

  # Wallpapers for Plasma
  cp -r rhino/wallpapers "${pkgdir}/usr/share"

  # Plasma Global Theme
  cp -r plasma/look-and-feel/org.rhinolinux.unicorn.desktop "${pkgdir}/usr/share/plasma/look-and-feel"

  # Plasma config
  install -Dm644 "plasma/kcm-about-distrorc" -t "${pkgdir}/etc/xdg"
  install -Dm644 "plasma/kdeglobals" -t "${pkgdir}/etc/xdg"
}