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
sha256sums=('6bf8de068426d63328e5ffbbd93f548c20329fe39945cf05a334153dd89ad487' '141734a490ec1bb4055f93e884d9b9c294c1a87f7b2334d6925a458e17eb9c31' '77ff65e5943a8bd187ab26e0b4ab90a6b40cc22cf3e761b5610d6ae316d72751')

package() {


  # Install the script to /usr/bin
  install -Dm755 "$srcdir/gemini.sh" "$pkgdir/usr/bin/gemini"

  # Install config file to /etc if applicable
  install -Dm644 "$srcdir/AIkonsole.conf" "$pkgdir/etc/AIkonsole.conf"



}
