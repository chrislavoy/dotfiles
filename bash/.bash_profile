# Note: This file was created on a Mac and is now considered deprecated

export PATH="$HOME/Library/Android:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH="$PATH:/usr/bin/gcc"

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

MYGO="$HOME/go/src/github.com/chrislavoy"
export MYGO

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/chrislavoy/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/chrislavoy
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/chrislavoy/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

eval "$(thefuck --alias)"

export QT_HOMEBREW=true

export AWS_REGION=us-west-1

alias ls="ls -G"
alias brewski="brew update && brew upgrade && brew cleanup"

#gophersay | lolcat
