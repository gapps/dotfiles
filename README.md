# dotfiles

All configuration files are a mess, mine are no different. Procede at you own
risk!

## Installation

### Stow

I use `stow` to set up links for the various configurations.

Install `stow` using `brew install stow`.

I prefer separate configuration directories for each service and you therefore
need to run `stow` for each service. It's a little more (one-time) overhead, but
it allows me to customize each machine that I work on.

### Clone the repo

Clone the repo to your desired location.

`mkdir ~/gapps/repos`\
`cd ~/gapps/repos`\
`git clone https://github.com/gapps/dotfiles.git`

### General Stow Command

In general, I use the following format for the `stow` command which is always
run from the root of the cloned repo.

`stow -t ~ -S ghostty --dotfiles`

The `-t` flag indicates the target directory to create the links in. The default
is one directory higher, but I like to store my cloned repositories in
`~/repos/` so I need to specify the target directory.

The `-S` flag indicates the directories to create links for. I usually do them
one by one, but you could combine them.

The `--dotfiles` flag indicates that files and directories in the repo ane named like
`dot-somefile` rather than `.somefile`. That's my preference.

## Ghostty Configuration

Ghostty is a terminal.

`stow -t ~ -S ghostty --dotfiles`

## Aerospace Configuration

Aerospace is a window manager for the Mac.

`stow -t ~ -S aerospace --dotfiles`

## Spaceship Configuration

Spaceship is used to construct the command prompt in zsh.

`stow -t ~ -S spaceship --dotfiles`

## Zsh Setup

```
cd
ln -s gapps/repos/dotfiles/zsh/zshrc .zshrc
ln -s gapps/repos/dotfiles/zsh/zshrc.after .zshrc.after
```

The zshrc.after file is an example file that is empty. This is the file you
would create for your specific setup on this particular machine. It will contain
configuration that you likely do not want leaking into the public domain. And,
obviously, you would create a symbolic link to your own file.

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
ln -s gapps/repos/dotfiles/bash/bash_profile .bash_profile
ln -s gapps/repos/dotfiles/bash/bashrc .bashrc
```

## Vim Configuration

This Vim stuff is quite dated at this stage as I have predominately moved to
Neovim.

TODO: Clean this Vim section up.

A little setup for new machines:

```
mkdir ~/.vim
cd ~/.vim
ln -s ~/gapps/repos/dotfiles/vim/vimrc vimrc
mkdir backup
mkdir colors
mkdir -p pack/plugins/start
mkdir swp
mkdir undo
```

### Vim Color Schemes

I use the following folder as a holding area for color themes:

`mkdir ~/gapps/repos/vim-color-schemes`

Into which I clone color schemes (gruvbox is my current favorite):

`cd ~/gapps/repos/vim-color-schemes`\
`git clone https://github.com/gruvbox-community/gruvbox.git`

And then copy the color theme to the Vim config directory:

`cd ~/gapps/repos/vim-color-schemes/gruvbox/colors`\
`cp gruvbox.vim ~/.vim/colors/.`

Now modify vimrc (this is already in my default vimrc file):

```
syntax enable
colorscheme gruvbox
```

## License

Dotfiles is released under the [MIT
License](https://opensource.org/licenses/MIT).
