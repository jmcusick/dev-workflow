# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jackcusick/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacs'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias emacs='emacs -nw'
alias terraform14='/usr/local/bin/aud-terraform-home/terraform14/bin/darwin/terraform'
alias terraform15='/usr/local/bin/aud-terraform-home/terraform15/bin/darwin/terraform'
alias terraform1='/usr/local/bin/aud-terraform-home/terraform1.0/bin/darwin/terraform'
alias terraform1_0_10='/Users/jackcusick/Applications/Terraform/1.0.10/terraform'
alias terraform='terraform1_0_10'
alias tf-docs="docker run -v $(pwd):/data --env 'DELIM_START=<!-- TFDOC_START -->' --env 'DELIM_CLOSE=<!-- TFDOC_END -->' --entrypoint /docker-entrypoint.sh cytopia/terraform-docs:0.9.1 terraform-docs-replace-012 md README.md"

alias rds-test="rds_ssh testing eu-central-1 jumphost.shared-testing.audibene.net aud-shared-testing.cgkrcdxleupl.eu-central-1.rds.amazonaws.com 17770"
alias rds-stage="rds_ssh staging eu-central-1 jumphost.shared-staging.audibene.net aud-shared-staging.cmjzr458gibu.eu-central-1.rds.amazonaws.com 17771"
alias rds-prod="rds_ssh production eu-central-1 jumphost.shared-production.audibene.net aud-shared-production.chb4mt6uvmu6.eu-central-1.rds.amazonaws.com 17772"
alias rds-prod-us="rds_ssh production us-east-1 jumphost-nvirginia.shared-production.audibene.net aud-shared-production.clizi56dhqpr.us-east-1.rds.amazonaws.com 17773"

alias rds-test-wts="rds_ssh testing eu-central-1 jumphost.shared-testing.audibene.net martech-services-wts-cron-testing.cgkrcdxleupl.eu-central-1.rds.amazonaws.com 17774"

alias rds-ols-prod="rds_ssh production us-east-1 jumphost-nvirginia.shared-production.audibene.net teleaudiology-ta-opportunity-lifecycle-servi-production-se.clizi56dhqpr.us-east-1.rds.amazonaws.com 17773"

alias rds-not-prod="rds_ssh production us-east-1 jumphost-nvirginia.shared-production.audibene.net teleaudiology-ta-notification-service-production-se.clizi56dhqpr.us-east-1.rds.amazonaws.com 17773"


alias k-busy='kubectl run -i --tty busybox --image=busybox --restart=Never --rm -- sh'

# Configuration from the ultimate terminal makeover guide
# https://towardsdatascience.com/the-ultimate-guide-to-your-terminal-makeover-e11f9b87ac99

eval "$(starship init zsh)"

[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh


#Begin: managed by swing
export AUD_AWS_HOME=/usr/local/bin/aud-terraform-home
#End: managed by swing

# Custom env vars
export PATH="/usr/local/opt/libpq/bin:$PATH"

# Custom functions
function rds_ssh {
    aws_get_session.sh -o aud -p shared-$1 -r AccountAdministrator
    # establish custom ssh connection
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -fMN -L$5:$4:5432 $3 -S /tmp/.ssh-rds.shared-$1.audibene.net-$5
    export PGPASSWORD="$(aws rds generate-db-auth-token --hostname=$4 --port=5432 --username=postgres --region $2 --profile aud-shared-$1)"
    psql -h localhost -p $5 -U postgres
    # terminating ssh connection
    ssh -S /tmp/.ssh-rds.shared-$1.audibene.net-$5 -O exit $3
}

# fix for navigation keys in JetBrains terminal
if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
  bindkey "∫" backward-word # Option-b
  bindkey "ƒ" forward-word # Option-f
  bindkey "∂" delete-word # Option-d
fi

function emacs-ro(){
  emacs "$@" --eval '(setq buffer-read-only t)'
}
