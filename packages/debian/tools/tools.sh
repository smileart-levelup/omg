pkg_prereqs=('apt-get')
pkg_extract_path=~/
pkg_description='Awesome set of useful tools'

function install_package() {
  sudo apt-get install curl
  sudo apt-get install tree
  sudo apt-get install feh
  sudo apt-get install ack-grep
  sudo apt-get install pv
}