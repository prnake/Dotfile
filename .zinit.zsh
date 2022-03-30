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
# examples here -> https://z-shell.pages.dev/docs/gallery/collection
zicompinit # <- https://z-shell.pages.dev/docs/gallery/collection#minimal

# 快速目录跳转
zi ice lucid wait='1' depth='1'
zi light skywind3000/z.lua

# Plugin history-search-multi-word loaded with investigating.
zi ice depth='1'
zi load zdharma-continuum/history-search-multi-word

# 语法高亮
zi ice lucid wait='0' atinit='zpcompinit'
zi light zdharma-continuum/fast-syntax-highlighting

# 自动建议
zi ice lucid wait="0" atload='_zsh_autosuggest_start'
zi light zsh-users/zsh-autosuggestions
zi load agkozak/zsh-z

# 补全
zi ice lucid wait='0'
zi light zsh-users/zsh-completions

# 加载 OMZ 框架及部分插件
zi snippet OMZ::lib/completion.zsh
zi snippet OMZ::lib/history.zsh
zi snippet OMZ::lib/key-bindings.zsh
zi snippet OMZ::lib/theme-and-appearance.zsh
zi snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zi snippet OMZ::plugins/sudo/sudo.plugin.zsh
zi snippet OMZ::plugins/extract

zi ice lucid wait='1'
zi snippet OMZ::plugins/git/git.plugin.zsh
zi snippet OMZ::plugins/kubectl/kubectl.plugin.zsh

# Git extension
zi as"null" wait"1" lucid for \
    sbin    Fakerr/git-recall \
    sbin    cloneopts paulirish/git-open \
    sbin    paulirish/git-recent \
    sbin    davidosomething/git-my \
    sbin atload"export _MENU_THEME=legacy" \
            arzzen/git-quick-stats \
    sbin    iwata/git-now \
    make"PREFIX=$ZPFX install" \
            tj/git-extras \
    sbin"bin/git-dsf;bin/diff-so-fancy" \
            zdharma-continuum/zsh-diff-so-fancy \
   sbin"git-url;git-guclone" make"GITURL_NO_CGITURL=1" \
            zdharma-continuum/git-url

# 加载 pure 主题
zplugin ice depth=1; zi light romkatv/powerlevel10k
