# 性能优化选项
skip_global_compinit=1
DISABLE_MAGIC_FUNCTIONS=true
ZSH_DISABLE_COMPFIX=true

# 补全系统设置
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Powerlevel10k 即时提示
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zi 插件管理器
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# 插件初始化
zicompinit

# 快速目录跳转
zi light agkozak/zsh-z

# 历史搜索增强
zi ice depth='1'
zi light zdharma-continuum/history-search-multi-word

# ------------------- 核心插件 -------------------
# 语法高亮
zi ice lucid atinit='zpcompinit'
zi light zdharma-continuum/fast-syntax-highlighting

# 自动建议
zi ice lucid atload='_zsh_autosuggest_start; bindkey "^R" autosuggest-accept'
zi light zsh-users/zsh-autosuggestions

# 补全增强
zi ice lucid wait='0' atload'zicompinit; zicdreplay'
zi light zsh-users/zsh-completions

# fzf-tab
zi ice lucid wait='0'
zi light Aloxaf/fzf-tab

# 加载 OMZ 框架及部分插件
zi snippet OMZ::lib/completion.zsh
zi snippet OMZ::lib/history.zsh
zi snippet OMZ::lib/key-bindings.zsh
zi snippet OMZ::lib/theme-and-appearance.zsh
zi snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zi snippet OMZ::plugins/sudo/sudo.plugin.zsh
zi snippet OMZ::plugins/extract
zi snippet OMZ::plugins/git/git.plugin.zsh

# fzf
zi ice from"gh-r" as"command"
zi light junegunn/fzf

# atuin (历史命令搜索)
zi ice lucid from"gh-r" as"program" \
    bpick"*x86_64-unknown-linux-gnu.tar.gz" \
    extract"" \
    mv"atuin*/atuin -> atuin" \
    atload'
        eval "$(atuin init zsh)"
        bindkey "^R" _atuin_search_widget
    '
zi light atuinsh/atuin

# ------------------- CLI 工具 -------------------
# eza (ls 增强)
zi ice lucid from"gh-r" as"program" \
    bpick"*x86_64-unknown-linux-musl.tar.gz" \
    extract"" \
    mv"eza* -> eza"
zi light eza-community/eza

# bat (cat 增强)
zi ice lucid from"gh-r" as"program" \
    bpick"*x86_64-unknown-linux-gnu.tar.gz" \
    extract"" \
    mv"bat*/bat -> bat"
zi light sharkdp/bat

# 延迟加载工具
zi ice wait="1" lucid from"gh-r" as"program" \
    bpick"*x86_64-unknown-linux-musl.tar.gz" \
    extract"" \
    mv"ripgrep*/rg -> rg"
zi light BurntSushi/ripgrep

zi ice wait="1" lucid from"gh-r" as"program" \
    bpick"*x86_64-unknown-linux-gnu.tar.gz" \
    extract"" \
    mv"fd*/fd -> fd"
zi light sharkdp/fd

zi ice wait="1" lucid from"gh-r" as"program" \
    bpick"*Linux_x86_64.tar.gz" \
    extract""
zi light jesseduffield/lazydocker

zi ice wait="1" lucid from"gh-r" as"program" \
    bpick"*linux-amd64.tar.gz" \
    extract"" \
    mv"fastfetch*/usr/bin/fastfetch -> fastfetch" \
    atload'chmod +x fastfetch'
zi light fastfetch-cli/fastfetch

# prettyping
zi ice wait="1" lucid as"program" pick"prettyping"
zi load denilsonsa/prettyping

# bat-extras
zi ice wait="1" lucid as"program" pick"src/batgrep.sh" pick"src/batdiff.sh"
zi light eth-p/bat-extras

# 加载 pure/powerlevel10k 主题
zi ice depth=1
zi light romkatv/powerlevel10k

# ------------------- 补全配置 -------------------
# 基础补全设置
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# fzf-tab 基础设置
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# fzf-tab 预览设置
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons -1 --color=always $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza --icons -1 --color=always $realpath'

# 进程补全预览
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'
zstyle ':fzf-tab:complete:kill:*' popup-pad 0 3

# fzf-tab 快捷键
zstyle ':fzf-tab:*' fzf-bindings '`:accept'
zstyle ':fzf-tab:*' switch-group '<' '>'

# ------------------- 自动建议配置 -------------------
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_COMPLETION_IGNORE='( |man |pikaur -S )*'
ZSH_AUTOSUGGEST_HISTORY_IGNORE='?(#c50,)'

# ------------------- fzf 配置 -------------------
export FZF_DEFAULT_OPTS="
--ansi
--layout=reverse
--info=inline
--height=50%
--multi
--cycle
--preview-window=right:50%
--preview-window=cycle
--prompt='λ -> '
--pointer='▷'
--marker='✓'
--color=bg+:236,gutter:-1,fg:-1,bg:-1,hl:-1,hl+:-1,prompt:-1,pointer:105,marker:-1,spinner:-1
"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# ------------------- Conda 配置 -------------------
export CONDA_AUTO_ACTIVATE_BASE=false
conda() {
    unfunction conda
    eval "$(/opt/miniforge/bin/conda shell.zsh hook)"
    conda $@
}
[[ "${CONDA_AUTO_ACTIVATE_BASE:-true}" == "true" ]] && {
    eval "$(/opt/miniforge/bin/conda shell.zsh hook)"
    conda activate base
}
