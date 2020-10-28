# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation
export ZSH="$(antibody path ohmyzsh/ohmyzsh)"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Initialize antibody and install plugins
source <(antibody init)

PLUGINS=(
    "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
    zsh-users/zsh-syntax-highlighting
    romkatv/powerlevel10k
)

for PLUGIN in "${PLUGINS[@]}"; do
    antibody bundle "${PLUGIN}"
done
unset PLUGINS

# Now that everything's set properly, source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias c='clear'

# Write HISTFILE to ~/.zsh directory
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# Export GPG_TTY using $TTY (works even when stdin is redirected)
export GPG_TTY=$TTY

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh
