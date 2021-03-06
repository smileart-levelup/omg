# http://drrb.github.io/gitsu/
pkg_prereqs=('brew ruby')
pkg_extract_path=~/
pkg_description='git - best version control system ever'

function install_package() {
  brew install git
  brew install tig
  brew install git-flow

  brew install legit
  legit install

  if b.system.command_exists 'gem'; then
    gem install gitsu
  fi

  git config --global mergetool.keepBackup false
  git config --global core.filemode false
  git config --global core.autocrlf input
  git config --global core.editor "vim"
  git config --global color.ui always
  git config --global push.default current
  git config --global branch.dev.remote origin
  git config --global branch.dev.merge refs/heads/dev
  git config --global alias.undo 'reset --soft HEAD^'
  git config --global alias.stash-unapply '!git stash show -p | git apply -R'


  if [[ $(b.string.is_empty $(git config --global user.email)) == 1 ]]; then
    git_email=$(b.ui.ask_for_input "Enter your git email")
    git config --global user.email "$git_email"
  fi

  if [[ $(b.string.is_empty $(git config --global user.name)) == 1 ]]; then
    git_username=$(b.ui.ask_for_input "Enter your git username")
    git config --global user.name "$git_username"
  fi

  if [[ $(b.string.is_empty $(git config --global merge.tool)) == 1 ]]; then
    git_mergetool=$(b.ui.ask_for_input "Enter your merge command")
    git config --global merge.tool $git_mergetool
  fi
}
