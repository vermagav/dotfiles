# My dotfiles

### Installation

* (Linux) Update Vim:

  ```
  sudo apt-get update
  sudo apt-get install vim
  ```

* (Mac) Update Vim:

  `brew install vim`
  
  If [homebrew](http://brew.sh/) installed vim to a different location, symlink to it:

  `ln -s /usr/local/Cellar/vim/7.4.712_1/bin/vim ~/bin/vim`

* Clone this repo and copy files:

  ```
  git clone https://github.com/vermagav/dotfiles.git ~/dotfiles
  cp ~/dotfiles/.bash* ~
  cp ~/dotfiles/.vimrc ~
  cp -r ~/dotfiles/.vim ~
  ```

* Clone [Vundle](https://github.com/VundleVim/Vundle.vim):

  `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

* Install vim plugins using Vundle:

  `vim +PluginInstall +qall`

* (Linux) Install [cmake](https://github.com/Kitware/CMake):

  `sudo apt-get install cmake`
  
* (Mac) Install [cmake](https://github.com/Kitware/CMake):

  `brew install cmake`

* Finalize installation of [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):

  This compiles YCM with semantic support for C-family languages.
  ```
  cd ~/.vim/bundle/YouCompleteMe
  ./install.sh --clang-completer
  ```
