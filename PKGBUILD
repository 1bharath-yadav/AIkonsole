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
sha256sums=('98a83ec213cbf48d832a6738b8d074459f0b06df8b11db43630b79b1129b701f' '141734a490ec1bb4055f93e884d9b9c294c1a87f7b2334d6925a458e17eb9c31' '74d22c9eb5dd28c586725214c6e9cb861dd48889cb16dbbd4f532099f0608422')

package() {


  # Install the script to /usr/bin
  install -Dm755 "$srcdir/gemini.sh" "$pkgdir/usr/bin/gemini"

  # Install config file to /etc if applicable
  install -Dm644 "$srcdir/AIkonsole.conf" "$pkgdir/etc/AIkonsole.conf"



}
