export LS_COLORS=$LS_COLORS:'di=0;35:'

export PATH="$HOME/.local/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# rust
. "$HOME/.cargo/env"

# bun
[ -s "/Users/pka/.bun/_bun" ] && source "/Users/pka/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

# Added by Windsurf
export PATH="/Users/pka/.codeium/windsurf/bin:$PATH"

# Amp CLI
export PATH="/Users/pka/.amp/bin:$PATH"

# opencode
export PATH=/Users/pka/.opencode/bin:$PATH