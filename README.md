# vimBundle
using bundle as vim package manager, aim to config a fast vim

## Vim setup instructions

1. Create a vimrc

	Create a vim configuration file in your home directory and a .vim/bundle directory
	```shell
	cp vimrc ~/.vimrc
	mkdir -p ~/.vim/bundle
	```

1. Add vundle

	If you'd like to use vundle to manage plugins, you can install it as a git submodule
	```shell
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
	```

	You will also need to let vim know about vundle by adding it to your `~/.vimrc`.
	```vim
	set rtp+=~/.vim/bundle/vundle/
	call vundle#begin()

	" let vundle manage vundle
	Plugin 'gmarik/vundle'
	
	" list all plugins that you'd like to install here
	Plugin 'kien/ctrlp.vim' " fuzzy find files
	Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
	Plugin 'benmills/vimux'
	Plugin 'tpope/vim-fugitive' " the ultimate git helper
	Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode

	call vundle#end()
	filetype plugin indent on
	```

1. Start vim and install default plugins

	```shell
	vim +PluginInstall
	```

