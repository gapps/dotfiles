# dotfiles

My collection of configuration files.

Not everything has made its way in here just yet, but it is happening (albeit
slowly).

## Installation

Clone the repo to your desired location.

`mkdir ~/gapps/repos`\
`cd ~/gapps/repos`\
`git clone https://github.com/gja22/dotfiles.git`

## Zsh Setup

```
cd
ln -s gja22/repos/dotfiles/zsh/zshrc .zshrc
ln -s gja22/repos/dotfiles/zsh/zshrc.after .zshrc.after
```

The zshrc.after file is an example file that is empty. This is the file you
would create for your specific setup on this particular machine. It will contain
configuration that you likely do not want leaking into the public domain.

## Tmux Setup

```
cd ~/.config/
ln -s ~/gapps/repos/dotfiles/tmux tmux
```

## Neovim Setup

```
cd ~/.config/
ln -s ~/gapps/repos/dotfiles/nvim nvim
```

## Bash Setup

I have not used the bash shell as an interactive shell for quite a while
(basically since Apple stopped suporting it as the default on MacOS). I still
use bash as the to execute utility scripts.

```
cd
ln -s gja22/repos/dotfiles/bash/bash_profile .bash_profile
ln -s gja22/repos/dotfiles/bash/bashrc .bashrc
```

## Vim Configuration

This Vim stuff is quite dated at this stage as I have predominately moved to
Neovim.

TODO: Clean this Vim section up.

A little setup for new machines:

```
mkdir ~/.vim
cd ~/.vim
ln -s ~/gja22/dotfiles/vim/vimrc vimrc
mkdir backup
mkdir colors
mkdir -p pack/plugins/start
mkdir swp
mkdir undo
```

### Vim Color Schemes

I use the following folder as a holding area for color themes:

`mkdir ~/gja22/vim-color-schemes`

Into which I clone color schemes (gruvbox is my current favorite):

`cd ~/gja22/vim-color-schemes`\
`git clone https://github.com/gruvbox-community/gruvbox.git`

And then copy the color theme to the Vim config directory:

`cd ~/gja22/vim-color-schemes/gruvbox/colors`\
`cp gruvbox.vim ~/.vim/colors/.`

Now modify vimrc (this is already in my default vimrc file):

```
syntax enable
colorscheme gruvbox
```

## License

Dotfiles is released under the [MIT
License](https://opensource.org/licenses/MIT).
