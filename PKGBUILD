pkgname=AIkonsole
pkgver=1.0
pkgrel=1
pkgdesc="A package to which integrates Gemini on Ctrl + / in Konsole"
arch=('any')
url="https://github.com/1bharath-yadav/AIkonsole"
license=('GPL')
depends=('bash' 'curl' 'jq')
source=('gemini.sh' 'AIkonsole.conf' 'AIkonsole.install')
install=AIkonsole.install
sha256sums=('90e9eaef8f87ab65181270d1834a90a5d87c6d9a3f28192d4ca797e605974b4f' '141734a490ec1bb4055f93e884d9b9c294c1a87f7b2334d6925a458e17eb9c31' '74d22c9eb5dd28c586725214c6e9cb861dd48889cb16dbbd4f532099f0608422')

package() {

  # Install the script to /usr/bin
  install -Dm755 "$srcdir/gemini.sh" "$pkgdir/usr/bin/gemini"

  # Install config file to /etc if applicable
  install -Dm644 "$srcdir/AIkonsole.conf" "$pkgdir/etc/AIkonsole.conf"

}
