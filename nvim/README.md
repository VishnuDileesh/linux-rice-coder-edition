## Install NeoVim
> sudo apt-get install neovim

## Clone linux-rice-coder-edition for nvim config file
> git clone git@github.com:VishnuDileesh/linux-rice-coder-edition.git

## Create nvim directory in ~/.config
> mkdir ~/.config/nvim

## Copy init.vim config file to newly created nvim directory
> cp ~/linux-rice-coder-edition/nvim/init.vim ~/.config/nvim/init.vim

## Install vim-plug
> sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Open neovim
> nvim 

## Install plugins
> :PlugInstall
