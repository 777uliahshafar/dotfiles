# Configuration for better terminal,vim,vimlatex workflow
Hello, This a coding workflow I created to help me documentate everything I use in order to get fast and comfortable workflow.


1). Install brew, Brew is a package manager that made easy for other package to be installed in mac.

    Installing Homebrew in Command Line Tools for Xcode :
```
[sudo](sudo) xcode-select --install
```

    Then :
```
[bin bash](/bin/bash) -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

2). Install Iterm2, Iterm2 is very similar to terminal, but with extra addition feature.

to Install Iterm2:
brew install Iterm2

3). Customize prompt in zsh and iterm2 can be achived by add code below in ~/.zshrc. This will add branch name git into your prompt.
~~~
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

~~~
4). Of cource, Standard customization iterm2 or zsh shell terminal will not give you such best convinient. In order to modify your text in the terminal usually editing .zshrc but it is not enough, there is a theme that can run faster than zsh shell which can be install by type:

Before install powerlever10k theme, it's highly recomended install MesloLGS font which you can find in source of repo:
	https://github.com/romkatv/powerlevel10k

Then Install by clone :
```	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```

after instal, You might want to edit its line in .zshrc to be on top of every line. After that you can configure all setting you prefere by type: p10k configure

5). Install Macvim, macVim is siply  a text editor that can be open in terminal. MacVim also has large feature that can bost our writing. The difference between macvim and vim is that macvim enable you using mouse and arrow in the workflow. By the way, vim has already installed in mac but in outdate version.

To install vim : brew install macvim

after instal, configure how to access macvim by type mvim -v or shorten it using alias in .vzhrc. Add alias vim="mvim -v".

6). Vim-plug is plugin manager for vim. This require curl to be installed though it already installed on the system. To install vim-plug just type:
```
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
After install, You can add and configure plug in .vimrc with:
```
	call plug#begin('~/.vim/plugged')
   	Plug 'jreybert/vimagit'
	Plug 'junegunn/goyo.vim'
	call plug#end()
```
The command for install plug is :PlugInstall

7). Install skim app for pdf view. Skim has great feature to reload after compilation. Which will not reload from beginning like Preview(Macos)

## Vim Plugin

8). Instal Vimtex Plugin for better latex workflow. Installation had already been set up in .vimrc. Just run :PlugInstall everytime system had reset. Configuration Vimtex has been setup in .vimrc as well.

9). Install UltiSnips. Installation had already been set up in .vimrc. Just run : PlugInstall everytime system had reset. UltiSnips mapping has been set up in .vimrc. Location snippets file in macvim/vim is in
```
	~/.vim/UltiSnips/[file.ext].snippets
```
