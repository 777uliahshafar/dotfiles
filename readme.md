*Start*:
* Change keyboard key for Caps Lock to escape mode. Go to System Preference -> keyboard -> Keyboard tab -> Modify Key -> Caps Lock to Esc.
* Add keyboard shortcut to move window to left or right side. Go to App shortcut in keyboard, add shortcut with title **Move Window to Left Side of Screen*.

# Setting up VIM as text editor

1. Homebrew is a *package manager* that made easy for other package to be installed in MacOS. It requires Xcode, can be installed by:
```
xcode-select --install
```
Then Homebrew itself:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

2. Iterm2 is very similar to terminal, but with extra addition feature. Installation using homebrew: `brew install Iterm2`.

3. Zsh auto-suggestion, install it using homebrew `brew install zsh-autosuggestions`.

4. Symlink .zshrc to home directory ~/.zshrc from dotfiles to add some customization zsh shell, like adding branch name git in the prompt.

5. Powerlevel10k for enhance customization iterm2 and zsh prompt. Requires **MesloLGS** font which can be found in [P10K](https://github.com/romkatv/powerlevel10k). Then install the p10k by:
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```

For accessing configuration file run this command `p10k configure`.Additional Feature of terminal or iterm2 should be changed for convenient:

- Change profile text by go to Preference -> Profile -> Text -> Change Font to MesloLGS -> Restart Iterm2.
-  Change margin left-right by go to Preferenced -> Advanced tab -> Search for margin -> Change 'width of left...' to 15 -> Restart Iterm2.
- Standar column and row of iterm should be set up to 80columns and 40rows with Normal style in window in Profile Tab.

6. **MacVim** is simply a text editor that can be open in terminal. MacVim also has large feature that can bost our writing. The difference between Macvim and Vim is that it enables you using mouse and arrow in the workflow. By the way, Vim has already installed in Mac but in outdate version. Install it using homebrew by this command `brew install macvim`.

7. Tmux for multiplex terminal.
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

- Instead of altering the ~/.tmux.conf file and diverging from upstream, *the proper way is to edit the ~/.tmux.conf.local file. !!!* **!Warning**: If you set iterm2 for maximaze, there would be instant red message in tmux status bar when enter tmux. Change profile style window from maximaze to normal.

- Shows existing sessions and gives me OPTION to re-attach or create a new one. Navigate to “Preferences > Profiles > PROFILE >Command > Send text at start” and set it to:

```
tmux ls && read tmux_session && tmux attach -t ${tmux_session:-def} || tmux new -s ${tmux_session:-def}
```

7. NVM is a robust package node manager, installation node.js and npm could be done by NVM instead brew.
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```
* To view listing package run the command `npm ls --depth=0`.
* To install node run the command `nvm install 10.18.0`

8. Vim-plug is plugin manager for Vim. It can be installed using curl by this command:
```
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Run `:PlugInstall` to install plugin vimrc.
Run `:PlugClean` to remove plugin after remove plugin line in vimrc.
Run: `:PlugStatus` to know information about plugin.

# Setting up Vim for R

1. Xquartz for viewing table from R.
```
brew install --cask xquartz
```

1. Install colorout for colorized R terminal. This required to load `library(colorout)` in R.
```
git clone https://github.com/jalvesaq/colorout.git
R CMD INSTALL colorout
```


# Vim plugin used in this repo.

Install all below plugin by running vim-plug `:PlugInstall`

* Vimtex Plugin for better latex workflow.
* UltiSnips and coc-snippets for adding snippet. The default location for snippet in coc-snippets is in ~/.config/coc/ultisnips. You may symlink snippet.tex from dotfiles.
* Gruvbox for colorscheme background.
* Goyo for free writing distraction.
* Vimagit for git local execution.
* Vim-myhelp for cheatsheet :h. This has its own config in my repo '777uliahshafar/vim-myhelp'.
* COC(Conquer of Completion) for LSP and others extention. Require a Node.js so it can works. All extentions automatically installed using coc_global_extentions within vimrc, if it was not works run `:Coc Install extentions`. Configuration file(coc-settings.json) located in runtime ./vim, please symlink from dotfiles. Access those file by `:CocConfig`
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

* Fzf Fuzzy Finder for browse file instantly. This use vim-rooter and ripgrep, ripgrep can be install using Homebrew `brew install ripgrep`
* Vim-Easy Align for align delimeters.
* Vim-Pencil for formating text with soft and hard break.
* Vim-surround for quoting/parenthesizing made simple.*(Webdevlopment)*
* Emmet-vim for expanding abbreviation in html and css.*(Webdevlopment)*
* Vim-javascript and jsx for javascript code syntax.
* Nvim-R for working with R
    - coc-r-lsp for autocompletion (required package languageserver)
    - ale for linting (required package lintr)


## Vimtex software preview.

* Skim for auto-refresh previewer pdf Latex.


# Setting up vim for web development.

1. This step is for linting and fixing code. First install the necessary ESLint dependencies in *Home Directory* ~/.
```
npm install --save-dev eslint prettier babel-eslint eslint-config-prettier eslint-plugin-prettier eslint-plugin-react

```
* Create a config file for ESLint in *Project Dir*: `touch .eslintrc.json`

* Add this configuration to file:
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
* And also you can add a .prettierrc file:
```
{
  "trailingComma": "es5",
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2
}
```

* The ALE Vim Plugin helps with linting and fixing code files in VIM. If the ale fails to show error, update the plugin.

2. Working with CSS and SCSS are better workflow, this step is to compile SCSS file to CSS continuously while save (watch). Install dependency by type `npm install --save-dev node-sass` in *project dir*.
* Add compile command 'scss' in **package.json** file, if the file isn't exist create by `npm init` in *project dir*.
* In the scripts section within that file add an *scss command*, under the *test command*, as it’s shown below:
```
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "scss": "node-sass --w scss/styles.scss scss/styles.css"
}
```
* Before you run this script, create folder scss and file styles.scss and styles.css on it. Then, Run this by `npm run scss` in Project Dir.

3. Browser-sync for live previewing save file from html, css or js in browser. Install [Browser-sync](https://browsersync.io) by run npm globally: `npm install -g browser-sync`. Alias command **serve** to live priviewing in *project dir*, manual command is:
```
browser-sync start --server --files "*.html, scss/*.css"
```

# ?Some help
## Exclude files from git
* The .gitignore have already exist. In order to configure excludefiles as Global environment. You could type:

```
git config --global core.excludefiles ~/git/dotfiles/.gitognore
```
## How to customize package
* Package customazation is datetime2 for dateformatting, and helpers4ht for better conversion to html. Those was can be used by these following:

1. Make dir/folder texmf/tex/latex

```
mkdir -p $(kpsewhich -var-value TEXMFHOME)/tex/latex/pkgname
```
* This will create the directory structure you need, presumably at ~/Library/texmf/

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
