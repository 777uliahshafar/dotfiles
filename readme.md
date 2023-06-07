<!-- This is only for Installation method or configuration vim. The full how to should be place on vimwiki or cheatsheet should be place on vim-myhelp -->

_Start_:

- Change keyboard key for Caps Lock to escape mode. Go to System Preference -> keyboard -> Keyboard tab -> Modify Key -> Caps Lock to Esc.
- Add keyboard shortcut to move window to left or right side. Go to App shortcut in keyboard, add shortcut with title \*_Move Window to Left Side of Screen_.

# Setting up VIM as text editor

1.  Homebrew is a _package manager_ that made easy for other package to be installed in MacOS. It requires Xcode, can be installed by:
    `xcode-select --install`
    Then Homebrew itself:
    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

1.1 Macport is similiar to homebrew. Install it through source form.

2.  Iterm2 is very similar to terminal, but with extra addition feature. Installation using homebrew: `brew install Iterm2`.

3.  Install oh-my-zsh, then install power10k through oh-my-zsh. Configure the p10k theme by changing value of zsh-theme in .zshrc. To install plugin through oh-my-zsh, you need the plugin in your system, after that write in your .zshrc (in dotfiles). Some plugins are git, zsh-autosuggestion, fzf, z. You can skip 4-6 if you use oh-my-zsh.

4.  Zsh auto-suggestion, install it using homebrew `brew install zsh-autosuggestions`.

5.  Symlink .zshrc to home directory ~/.zshrc from dotfiles to add some customization zsh shell, like adding branch name git in the prompt.

6.  Powerlevel10k for enhance customization iterm2 and zsh prompt. Requires **MesloLGS** font which can be found in [P10K](https://github.com/romkatv/powerlevel10k). However, for writing convinience keep using Inconsolata.Then install the p10k by:

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```

For accessing configuration file run this command `p10k configure`. The configration p10k already copied in dotfiles. Additional Feature of terminal or iterm2 should be changed for convenient:

- Change profile text by go to Preference -> Profile -> Text -> Change Font to MesloLGS -> Restart Iterm2.
- Change margin left-right by go to Preferenced -> Advanced tab -> Search for margin -> Change 'width of left...' to 15 -> Restart Iterm2.
- Standar column and row of iterm should be set up to 80columns and 40rows with Normal style in window in Profile Tab.

Another font has installed for vim called Inconsolata regular 20 created by Raph Levien. It is a monospace font, designed for code listings and the like, in print. In order to get maximum result, ensure you enable anti-aliased, and use ligatures.
You can simply download iterm profile on dotfiles.

6. **MacVim** is simply a text editor that can be open in terminal. MacVim also has large feature that can bost our writing. The difference between Macvim and Vim is that it enables you using mouse and arrow in the workflow. By the way, Vim has already installed in Mac but in outdated version. Macvim has been deprecated by homebrew in Macos Catalina, use another package manager instead.

7. Mac_classic and molokai are schemes for vim. Mac_classic is a customized colorscheme by drewneil. The mac_classic.vim already copied to dotfiles. Use gruvbox palette by source its shellscript from dotfiles to .zshrc.

Mac_classic uses gruvbox palette which sometimes make colors is off in a terminal. A fix already works however for references see: https://github.com/morhetz/gruvbox/wiki/Terminal-specific

8. Tmux for multiplex terminal.

- Install using homebrew by `brew install tmux`.
- Customize it with oh-my-tmux, install it by :

```
cd
git clone https://github.com/gpakosz/.tmux.git
```

- Remove its remote origin by `git remote rm origin`
- Symlink from that repo to homedir:

```
ln -s -f .tmux/.tmux.conf
ln -s -f ~/git/dotfiles/.tmux.conf.local ~/.tmux.conf.local
```

- Instead of altering the ~/.tmux.conf file and diverging from upstream, _the proper way is to edit the ~/.tmux.conf.local file. !!!_ **!Warning**: If you set iterm2 for maximaze, there would be instant red message in tmux status bar when enter tmux. Change profile style window from maximaze to normal.

- Shows existing sessions and gives me OPTION to re-attach or create a new one. Navigate to “Preferences > Profiles > PROFILE >Command > Send text at start” and set it to:

```
tmux ls && read tmux_session && tmux attach -t ${tmux_session:-def} || tmux new -s ${tmux_session:-def}
```

- Install tmux plugin manager
- install tmux-resurrect (prefix+ ctrl-s/ctrl-r)

9. colorls exa

10. NVM is a robust package node manager, installation node.js and npm could be done by NVM instead brew.

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

- To view listing package run the command `npm ls --depth=0`.
- To install node run the command `nvm install 10.18.0`

11. Vim-plug is plugin manager for Vim. It can be installed using curl by this command:

```
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run `:PlugInstall` to install plugin vimrc.
Run `:PlugClean` to remove plugin after remove plugin line in vimrc.
Run: `:PlugStatus` to know information about plugin.

12. Spellchecker includes on dotfiles. These contain three unseperated files. The .add extention meaning file has been added new word. These files have already rsycn to `$VIMRUNTIME SPELL` in `~/.vim/spell/`.

13. Use vimdiff in gitdiff. It can be installed with command:

```
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
```

alias git d. You can check in ~/.gitconfig

Use better syntax highlight in vimdiff with `https://github.com/dandavison/delta`

# Setting up Vim for R

1. Xquartz for viewing table from R.

```
brew install --cask xquartz
```

1. Install colorout for colorized R terminal. This required to load `library(colorout)` or recommend `require(colorout)` in R.

```
git clone https://github.com/jalvesaq/colorout.git
R CMD INSTALL colorout
```

# Vim plugin used in this repo.

Install all below plugin by running vim-plug `:PlugInstall`

- Vimtex Plugin for better latex workflow, include installation of basicTex rather than mactex(huge). It needs configuration PATH which is already done. Each time you install tlgmr package (use brew install --cask tex-live-utility), compiler clean was needed frequently.
- FastFold for better and fast folding
- UltiSnips and coc-snippets for adding snippet. The default location for snippet in coc-snippets is in ~/.config/coc/ultisnips. Symlink for snippet is not work here, it must be copied. Caveat: au!ultisnips_autotrigger didn't work, so commenting line from `augroup Ultisnips_AutoTrigger` to `augroup end` in ~/.vim/plugged/ultisnips/plugin/UltiSnips.vim.
- Goyo for free writing distraction.
- Vimagit for git local execution.
- Vim-myhelp for cheatsheet :h. This has its own config in my repo '777uliahshafar/vim-myhelp'. You can modify/add this somewhere that Vim looks when loading plugins. eg ~/.vim/plugged/..
- COC(Conquer of Completion) for LSP and others extention. Require a Node.js so it can works. All extentions automatically installed using coc_global_extentions within vimrc, if it was not works run `:CocInstall extentions`. For some extension, it does not work so install it manually.Configuration file(coc-settings.json) located in runtime ./vim, please symlink from dotfiles. Access those file by `:CocConfig`
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-angular',
  \ 'coc-explorer',
  \ 'coc-vimtex'

- Fzf Fuzzy Finder for browse file instantly. This use vim-rooter and ripgrep, ripgrep can be install using Homebrew `brew install ripgrep`
- Vim-Easy Align for align delimeters.
- Vim-Pencil for formating text with soft and hard break.
- Vim-Markdown for markdown syntax, there is modified syntax file `markdown.vim` on dotfiles where should be place on ~/.vim/plugged/vim-markdown/syntax.
- Vim-surround for quoting/parenthesizing made simple._(Webdevlopment)_
- Emmet-vim for expanding abbreviation in html and css._(Webdevlopment)_
- Vim-javascript and jsx for javascript code syntax.
- Nvim-R for working with R
  - coc-r-lsp for autocompletion (required package languageserver)
  - ale for linting (required package lintr). Config file can be created in working directory (default file name: .lintr). For example .lintr

```
linters: with_defaults(
  line_length_linter(120),
  commented_code_linter = NULL
  )
```

- configure sync-Tex in skim. See manual(NvimR).

## Vimtex software preview.

- Skim for auto-refresh previewer pdf Latex.
- SplitShow for dual-head presentation of PDF slides. Important note: Sync navigation slide only work with arrow key.

# Setting up vim for web development.

1. This step is for linting and fixing code. First install the necessary ESLint dependencies in _Home Directory_ ~/.

```
npm install --save-dev eslint prettier babel-eslint eslint-config-prettier eslint-plugin-prettier eslint-plugin-react

```

- Create a config file for ESLint in _Project Dir_: `touch .eslintrc.json`

- Add this configuration to file:

```
{
    "env": {
        "browser": true,
        "es6": true,
        "node": true
    },
    "plugins": ["prettier", "react"],
    "extends": [
        "eslint:recommended",
        "plugin:react/recommended",
        "prettier/react",
        "plugin:prettier/recommended"
    ],
    "parser": "babel-eslint",
    "parserOptions": {
        "ecmaVersion": 2020,
        "ecmaFeatures": { "jsx": true },
        "sourceType": "module"
    },

    "rules": {
        "prettier/prettier": "error"
    },
    "settings": {
        "react": {
            "version": "detetect"
        }
    }
}

```

- And also you can add a .prettierrc file:

```
{
  "trailingComma": "es5",
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2
}
```

- The ALE Vim Plugin helps with linting and fixing code files in VIM. If the ale fails to show error, update the plugin.

2. Working with CSS and SCSS are better workflow, this step is to compile SCSS file to CSS continuously while save (watch). Install dependency by type `npm install --save-dev node-sass` in _project dir_.

- Add compile command 'scss' in **package.json** file, if the file isn't exist create by `npm init` in _project dir_.
- In the scripts section within that file add an _scss command_, under the _test command_, as it’s shown below:

```
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "scss": "node-sass --w scss/styles.scss scss/styles.css"
}
```

- Before you run this script, create folder scss and file styles.scss and styles.css on it. Then, Run this by `npm run scss` in Project Dir.

3. Browser-sync for live previewing save file from html, css or js in browser. Install [Browser-sync](https://browsersync.io) by run npm globally: `npm install -g browser-sync`. Alias command **serve** to live priviewing in _project dir_, manual command is:

```
browser-sync start --server --files "*.html, scss/*.css"
```

# ?Some help

## Lag/Slow writing a long line and large file vim

Refresh fold with <F6>, from fastfold

## Exclude files from git

- The .gitignore have already exist. In order to configure excludefiles as Global environment. You could type:

```
git config --global core.excludefiles ~/git/dotfiles/.gitognore
```

## How to customize package

- Package customazation is datetime2 for dateformatting, and helpers4ht for better conversion to html. Those was can be used by these following:

1. Make dir/folder texmf/tex/latex

```
mkdir -p $(kpsewhich -var-value TEXMFHOME)/tex/latex/pkgname
```

- This will create the directory structure you need, presumably at ~/Library/texmf/

2. Symlink folder in above location.
3. If the pkg are in github, assume you have done step 1, you can install it by for example.

```
cd ~/Library/texmf/tex/latex
git clone https://github.com/777uliahshafar/helpers4ht.git
```

4. helpers4ht package need configuration which already set up in make4ht template.

## How to deal with Swap Warning

1. Recover the swap file(r)
2. If the content looks right, Save(:w) and Reopen(:e).
3. If the content older, Reopen without Save(:r!)
4. Delete swap file (d) or manually from zsh.

## How to use this REPO

This repo has a collection of awesome configuration code. Each time a man clone this, should Symlink each file config to coresponding location. For example snippets file in ~/git/dotfiles/Ultisnips/ will be read on ~/.vim/plugged/ultisnips/ folder. So here a man type:

```
	ln -s [file_original_location] [destionation]
	eg. ln -s ~/git/dotfiles/UltiSnips/tex.snippets ~/.config/coc/ultisnips
```

# Instalation on Windows Under WSL

1. Install winget through Windows PowerShell
```
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Script -Name winget-install -Force
winget-install.ps1
```

Sometimes winget cannot be installed, therefore you need to execute this:
- Run as administrator Win Powershell
- Run this code : Get-ExecutionPolicy
- Then : Set-ExecutionPolicy RemoteSigned 
- TYpe Y

By doing so, you're suppose to be able install Winget

1. Install Windows Terminal, through Powershell (without microsoft store):
- Open website `https://apps.microsoft.com/store/apps` to look for url application
- Paste the url in https://store.rg-adguard.net/
- Copy the url program, then run this on Win Powershell:
```
>> irm "paste url program" -o nameprogram.appx
>> Add-AppxPackage .\nameprogram.appx
```

1. Activate WSL on windows by run this on administration:
`dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`

1. Install Linux distribution ubuntu (without microsoft store)
- open ubuntu app (it is one time process)
- set up username and pass

1. Make Ubuntu as default shell in windows terminal setting > Startup > Default Profile.

1. Install Nerd font CaskaydiaCove Nerd Font Mono.

1. Configure windows terminal default profile appearance, go to setting > profile > default > appearance.
- Change the font face to caskaydiacove.
- Enable Acrilyc, set to 40% transparancy.
- Change the color scheme, go to json file, add this line to the schemes lines.

```
{
            "background": "#010409",
            "black": "#010409",
            "blue": "#61AFEF",
            "brightBlack": "#5A6374",
            "brightBlue": "#61AFEF",
            "brightCyan": "#56B6C2",
            "brightGreen": "#98C379",
            "brightPurple": "#C678DD",
            "brightRed": "#E06C75",
            "brightWhite": "#F8F8F2",
            "brightYellow": "#E5C07B",
            "cursorColor": "#FFFFFF",
            "cyan": "#56B6C2",
            "foreground": "#F8F8F2",
            "green": "#4E9A06",
            "name": "One Half Dark (moded)",
            "purple": "#C678DD",
            "red": "#E06C75",
            "selectionBackground": "#FFFFFF",
            "white": "#F8F8F2",
            "yellow": "#E5C07B"
        },
```

- Change the keybinding windows terminal by adding:
    ```
"keybindings":
[
    {"command": {"action":"copy","singleLine":false}, "keys" :"ctrl+c"},
    {"command": "paste", "keys" : "ctrl+v"},
    {"command": "closePane", "keys" :"ctrl+w"},
    {"command": "splitPane", "keys" :"ctrl+_"},
    { "command": { "action": "splitPane", "split": "horizontal" }, "keys": "alt+shift+-" },
    { "command": { "action": "moveFocus", "direction": "down" }, "keys": "ctrl+shift+j" },
    { "command": { "action": "moveFocus", "direction": "left" }, "keys": "alt+shift+h" },
    { "command": { "action": "moveFocus", "direction": "right" }, "keys": "alt+shift+l" },
    { "command": { "action": "moveFocus", "direction": "up" }, "keys": "alt+shift+k" },
    {"command": "newTab", "keys" :"ctrl+T"},
    {"command": "toggleFocusMode", "keys" :"shift+f11"},
    {"command": "toggleAlwaysOnTop", "keys" :"ctrl+d"},
    {"command": "commandPalette", "keys" :"ctrl+shift+p"},
    {"command": "find", "keys" :"ctrl+shift+f"}
],
    
    ```

1. Replace caps lock to esp. Find caps lock to esc registry.
- Open regedit, go to file > import > choose the registry capslock to esc.

1. Install neovim withing wsl distribution
```
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update
sudo apt-get install neovim
```

### set up nvim

1. Set up init.vim (the configuration file)
- create a directory to hold the init.vim file in ~/.config/nvim/init.vim
`:call mkdir(stdpath('config'), 'p')`

- then create an init.vim file
`:exe 'edit '.stdpath('config').'/init.vim'`

1. Install vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### set up zsh
1. git clone your dotfiles

1. Install sublime IDE for temporary editor (try to avoid open json file before install this).

1. Install Zsh
```
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install zsh
zsh
```

1 Install oh my zsh:
- install curl
`sudo apt-get install curl`
- install ohmyzsh
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### next step
1. install git 
`sudo apt-get install git`

1. Connect to github with ssh key
- generate ssh-key public which will be  on .ssh/
`ssh-keygen -o -t rsa -C "777uliahshafar@gmail.com"`
- copy the content of id_rsa.pub to github setting ssh and gpg keys with random title.
- using ssh url to git clone repo, for the one time thing your will be asked, just say yes.

1. replace .zshrc and .p10k.zsh from  dotfiles, then run `source .zshrc`
PS. You will see many prompt to install plugin dependency/repo

1. Install plugin zshrc through oh-my-zsh
- clone each plugin repository
zsh-autosuggestions
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
zsh-syntax-highlighting
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
fzf-zsh
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
z
`git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z`
powerlevel10k
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
- source .zshrc

1. install exa for replacement of ls
```
sudo apt install exa
```
