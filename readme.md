# Configuration for better terminal,vim,vimlatex workflow
Hello, This a coding workflow I created to help me documentate everything I use in order to get fast and comfortable workflow.

Before to go: You might change keyboard key for Caps Lock to escape mode. Go to System Preference -> keyboard -> Keyboard tab -> Modify Key -> Caps Lock to Esc.

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
4A). Of cource, Standard customization iterm2 or zsh shell terminal will not give you such best convinient. In order to modify your text in the terminal usually editing .zshrc but it is not enough, there is a theme that can run faster than zsh shell which can be install by type:

Before install powerlever10k theme, it's highly recomended install MesloLGS font which you can find in source of repo:
	https://github.com/romkatv/powerlevel10k

Then Install by clone :
```	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```

after instal, You might want to edit its line in .zshrc to be on top of every line. After that you can configure all setting you prefere by type: p10k configure

Additional Feature of terminal or iterm2 should be changed for convenient:
a). Change profile text by go to Preference -> Profile -> Text -> Change Font to MesloLGS -> Restart Iterm2.
b).  Change margin left-right by go to Preferenced -> Advanced tab -> Search for margin -> Change 'width of left...' to 15 -> Restart Iterm2.
c). Standar column and row of iterm should be set up to 80columns and 40rows with Normal style in window in Profile Tab.

4B). Install tmux through Homebrew by type:
```
brew install tmux
```

After that using oh-my-tmux for customization and optimal keybinding by type:
```
cd
git clone https://github.com/gpakosz/.tmux.git
```
After we clone it, we might want to remove its remote origin, just run `git remote rm origin`. Then, you can symylink as below:

```
ln -s -f .tmux/.tmux.conf
ln -s -f ~/git/dotfiles/.tmux.conf.local ~/.tmux.conf.local
```
Instead of altering the ~/.tmux.conf file and diverging from upstream, the proper way is to edit the ~/.tmux.conf.local file.

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

Uninstall Plugin by remove plug line or comment it, then restart or :so .vimrc then type :PlugClean

To get Information about status of plugin type :PlugStatus

7). Install skim app for pdf view. Skim has great feature to reload after compilation. Which will not reload from beginning like Preview(Macos)

## Vim Plugin


8). Instal Vimtex Plugin for better latex workflow. Installation had already been set up in .vimrc. Just run :PlugInstall everytime system had reset. Configuration Vimtex has been setup in .vimrc as well.

9). Install UltiSnips. Installation had already been set up in .vimrc. Just run : PlugInstall everytime system had reset. UltiSnips mapping has been set up in .vimrc. Since Coc has snippet extentions, we also install it by:

```
	:CocInstall coc-snippets
```
The default location for snippet in coc-snippets is in ~/.config/coc/ultisnips. You may symlink snippet.tex from dotfiles.


10). Background shell iterm/zsh was not good enough. Install gruvbox to handle the background. sAll configuration has already set up in vimrc.

11). You have installed Goyo in step 6, but this is show you a configuration that make goyo work better.

12). Install Vimagit

13). Install vim-myhelp in my repo by git clone to ~/.vim/plugged/. After that install plug via vimplug by write 777uliahshafar/vim-myhelp then :PlugInstall. :h myhelp shoudl works.

14). Install Coc-Explorer extention by Coc(Conquer of Completion).
a). Install COC (Intellisense engine), run by javascript code, so we need install Node.js by using Homebrew then type in zsh terminal:
```
brew install node
```

b). Install COC Plugin of VIM with VimPlug, installation have written in vimrc:
```
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
```
then run :PlugInstall,


c). Install COC explorer as Tree Viewer in VIM, by type command (Coc Explorer is an extention of Coc Plugin):
```
:CocInstall coc-explorer
```
Configuration for opening coc-explorer have already set up in vimrc, just open tree viewer coc-explorer by keybinding <space>e.

d). CocConfig settings
Enable intellisense for coc-settings.json with:
```
:CocInstall coc-json
```
in your vim

Symlink Coc Configuration(coc-settings.json) file from git/dotfiles  to ./vim, After that you can call that configuration by type :CocConfig

e). All basic configuration and cocConfig(advanced) have already in your .vimrc and CocConfig.

15). Install Fzf Fuzzy Finder in order to search file easily. Instalation have written in vimrc, there 4 instalation needed:
```
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
```
Fzf or Ag command requires ripgrep, installation can be done by type in zsh command line:
```
brew install ripgrep
```

16). Install vim-easyalign for align tab. Instalation have written in vimrc:
```
Plug 'junegunn/vim-easy-align'
```

17). Install vim pencil for best formatting soft line brake. Instalation have written in vimrc:

```
Plug 'junegunn/vim-easy-align'
```


# Configuration for web development
1). Install eslint for linting javascript and typescript, prerequisites is nodejs10. You might install by running npm :
`npm install eslint --save-dev`. Then, make configuration file for it from terminal: `./node_modules/.bin/eslint --init`. You can modify its configuration that being made in home directory. In order to work with vim, instal Coc-eslint in our vim `:CocInstall coc-eslint`.

2). Install npm prettier(not Coc-prettier) for get ESlint reporting about Prettier errors. In order to do that, install by run: `npm install -D prettier eslint-plugin-prettier eslint-config-prettier` Then, update ESLint configuration in home dir, make sure the prettier put last line look like something like the following:
```
{
  “extends”: [
    “eslint:recommended”,
    “prettier”
  ],
  “plugins”: [
    “prettier”
  ],
  “rules”: {
    “prettier/prettier”: “error”
  }
}

```
3). To look better at code use syntax. Install vim-javascript and jsx.
Instalation and config have written in vimrc, just run :PlugInstall.




### Exclude files from git
The .gitignore have already exist. In order to configure excludefiles as Global environment. You could type:

```
git config --global core.excludefiles ~/git/dotfiles/.gitognore

```
### How to customize package
Pkg customazation is datetime2 for dateformatting, and helpers4ht for better conversion to html.Those was can be use by these following:

1). Make dir/folder texmf/tex/latex

```
mkdir -p $(kpsewhich -var-value TEXMFHOME)/tex/latex/pkgname
```
This will create the directory structure you need, presumably at ~/Library/texmf/

2). Symlink folder in above location.
3). If the pkg are in github,assume you have done step 1, you can install it by for example.

```
cd ~/Library/texmf/tex/latex
git clone https://github.com/777uliahshafar/helpers4ht.git
```
4). helpers4ht package need configuration which already set up in make4ht template.

###How to deal with Swap Warning

1). Recover the swap file(r)
2). If the content looks right, Save(:w) and Reopen(:e).
3). If the content older, Reopen without Save(:r!)
4). Delete swap file (d) or manually from zsh.

### How to use this REPO
	This repo has a collection of awesome configuration code. Each time a man clone this, should Symlink each file config to coresponding location. For example snippets file in ~/git/dotfiles/Ultisnips/ will be read on ~/.vim/plugged/ultisnips/ folder. So here a man type:
```
	ln -s [file_original_location] [destionation]
	eg. ln -s ~/git/dotfiles/UltiSnips/tex.snippets ~/.config/coc/ultisnips
```
