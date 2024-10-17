pkgname=AIkonsole
pkgver=1.0
pkgrel=1
pkgdesc="A package to which integrates Gemini on Ctrl + / in Konsole"
arch=('any')
url="https://github.com/1bharath-yadav/AIkonsole"
license=('GPL')
depends=('bash' 'curl' 'jq')
source=('gemini.sh' 'AIkonsole.conf')
install=AIkonsole.install
sha256sums=('9d296b51b670e5b9d2e5be495bb2aef8d37304abfd567938b3aad2ac9377ae22' '95d4d6c19177edacdeda98fdefcec45172ec7e9eea1abc1f0581d11d11d37c63')

package() {


  # Install the script to /usr/bin
  install -Dm755 "$srcdir/gemini.sh" "$pkgdir/usr/bin/gemini"

  # Install config file to /etc if applicable
  install -Dm644 "$srcdir/AIkonsole.conf" "$pkgdir/etc/AIkonsole.conf"



}
