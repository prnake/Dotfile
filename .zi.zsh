skip_global_compinit=1
DISABLE_MAGIC_FUNCTIONS=true
ZSH_DISABLE_COMPFIX=true

# 补全系统设置
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20


# zinit 插件管理器
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ------------------- 平台检测 -------------------
case "$(uname -s)-$(uname -m)" in
    Darwin-arm64)
        _ATUIN_BPICK="*aarch64-apple-darwin.tar.gz"
        _EZA_BPICK=""  # eza 无 macOS 二进制，需 brew install eza
        _BAT_BPICK="*aarch64-apple-darwin.tar.gz"
        _RG_BPICK="*aarch64-apple-darwin.tar.gz"
        _FD_BPICK="*aarch64-apple-darwin.tar.gz"
        _LAZYDOCKER_BPICK="*Darwin_arm64.tar.gz"
        _FASTFETCH_BPICK="*macos-aarch64.tar.gz"
        _FASTFETCH_MV="fastfetch*/usr/bin/fastfetch -> fastfetch"
        _DUF_BPICK="*darwin_arm64.tar.gz"
        ;;
    Darwin-x86_64)
        _ATUIN_BPICK="*x86_64-apple-darwin.tar.gz"
        _EZA_BPICK=""
        _BAT_BPICK="*x86_64-apple-darwin.tar.gz"
        _RG_BPICK="*x86_64-apple-darwin.tar.gz"
        _FD_BPICK="*x86_64-apple-darwin.tar.gz"
        _LAZYDOCKER_BPICK="*Darwin_x86_64.tar.gz"
        _FASTFETCH_BPICK="*macos-amd64.tar.gz"
        _FASTFETCH_MV="fastfetch*/usr/bin/fastfetch -> fastfetch"
        _DUF_BPICK="*darwin_x86_64.tar.gz"
        ;;
    Linux-x86_64|*)
        _ATUIN_BPICK="*x86_64-unknown-linux-gnu.tar.gz"
        _EZA_BPICK="*x86_64-unknown-linux-gnu.tar.gz"
        _BAT_BPICK="*x86_64-unknown-linux-gnu.tar.gz"
        _RG_BPICK="*x86_64-unknown-linux-musl.tar.gz"
        _FD_BPICK="*x86_64-unknown-linux-gnu.tar.gz"
        _LAZYDOCKER_BPICK="*Linux_x86_64.tar.gz"
        _FASTFETCH_BPICK="*linux-amd64.tar.gz"
        _FASTFETCH_MV="fastfetch*/usr/bin/fastfetch -> fastfetch"
        _DUF_BPICK="*linux_x86_64.tar.gz"
        ;;
esac

# ------------------- zinit 插件管理器 -------------------
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit annexes
zinit ice wait"1" lucid as"null" for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ------------------- 主题 -------------------
zinit ice depth=1
zinit light romkatv/powerlevel10k

# ------------------- 核心插件 -------------------
# fzf
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf

# 补全增强 & 补全初始化
zinit ice wait"0a" lucid atload"zicompinit; zicdreplay" blockf
zinit light zsh-users/zsh-completions

# fzf-tab
zinit ice wait"0b" lucid
zinit light Aloxaf/fzf-tab

# OMZ 插件 (只保留必要的)
zinit snippet OMZ::plugins/git/git.plugin.zsh

# 自动建议
zinit ice wait"0c" lucid \
    atload'
        _zsh_autosuggest_start
        bindkey "\`" autosuggest-accept
    '
zinit light zsh-users/zsh-autosuggestions

# 历史命令
zinit ice wait"0d" lucid from"gh-r" as"program" \
    bpick"$_ATUIN_BPICK" \
    extract"" \
    mv"atuin*/atuin -> atuin" \
    atload'
        eval "$(atuin init zsh --disable-up-arrow)"
        bindkey "^R" _atuin_search_widget
    '
zinit light atuinsh/atuin

# 语法高亮
zinit ice wait"0e" lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

# ------------------- CLI 工具 -------------------
# 核心工具（无延迟加载）
if [[ -n "$_EZA_BPICK" ]]; then
    zinit ice wait"0" lucid from"gh-r" as"program" \
        bpick"$_EZA_BPICK" \
        extract"" \
        mv"eza* -> eza"
    zinit light eza-community/eza
fi

zinit ice wait"0" lucid from"gh-r" as"program" \
    bpick"$_BAT_BPICK" \
    extract"" \
    mv"bat*/bat -> bat"
zinit light sharkdp/bat

# 延迟加载工具
zinit ice wait"1" lucid from"gh-r" as"program" \
    bpick"$_RG_BPICK" \
    extract"" \
    mv"ripgrep*/rg -> rg"
zinit light BurntSushi/ripgrep

zinit ice wait"1" lucid from"gh-r" as"program" \
    bpick"$_FD_BPICK" \
    extract"" \
    mv"fd*/fd -> fd"
zinit light sharkdp/fd

zinit ice wait"1" lucid from"gh-r" as"program" \
    bpick"$_LAZYDOCKER_BPICK" \
    extract""
zinit light jesseduffield/lazydocker

zinit ice wait"1" lucid from"gh-r" as"program" \
    bpick"$_FASTFETCH_BPICK" \
    extract"" \
    mv"$_FASTFETCH_MV" \
    atclone"chmod +x fastfetch" \
    atpull"%atclone"
zinit light fastfetch-cli/fastfetch

zinit ice wait"1" lucid from"gh-r" as"program" \
    bpick"$_DUF_BPICK" \
    extract=""
zinit light muesli/duf

zinit ice wait"1" lucid as"program" pick"prettyping"
zinit load denilsonsa/prettyping

# bat-extras
zinit ice wait"1" lucid as"program" \
    pick"src/batgrep.sh" pick"src/batdiff.sh" \
    atload'alias batgrep="batgrep.sh"; alias batdiff="batdiff.sh"'
zinit light eth-p/bat-extras


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

# ------------------- 其他工具配置 -------------------
# zoxide
eval "$(zoxide init zsh --cmd cd)"
