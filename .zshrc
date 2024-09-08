ZINIT_HOME="${XDA_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir --parents "$(dirname $ZINIT_HOME)"
	git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

NERD_FONTS_HOME="${HOME}/.local/share/fonts"
if [ ! -d "$NERD_FONTS_HOME" ] ; then
	mkdir --parents "$NERD_FONTS_HOME"
	wget --directory-prefix /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip
	unzip -d "$NERD_FONTS_HOME" /tmp/0xProto.zip
	rm /tmp/0xProto.zip
	fc-cache --force
fi

FZF_HOME="${HOME}/.fzf"
if [ ! -d "$FZF_HOME" ]; then
	mkdir --parents "$FZF_HOME"
	git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_HOME"
	bash ${FZF_HOME}/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

autoload -U compinit && compinit

zinit cdreplay -q

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview "ls -color $realpath"

alias ls="ls --color"
alias vim="nvim"

export PATH=$PATH:/home/onlinejudge95/.local/bin:/usr/local/go/bin
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/atomic.omp.json)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
