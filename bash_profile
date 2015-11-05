alias ll='ls -ol'
PATH=.bin:.:~/bin:$PATH
export PATH
#export PATH=/usr/local/bin:$PATH
source ~/.git-completion.bash
source ~/licuiting/nvm/nvm.sh
# iterm2 color configuration
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export EDITOR=vim
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/dist

source /usr/local/git/contrib/completion/git-prompt.sh

#-- show branch name begin --
find_git_branch () {
	local dir=. head
	until [ "$dir" -ef / ]; do
		if [ -f "$dir/.git/HEAD" ]; then
			head=$(< "$dir/.git/HEAD")
			if [[ $head = ref:\ refs/heads/* ]]; then
				git_branch=" → ${head#*/*/}"
			elif [[ $head != '' ]]; then
				git_branch=" → (detached)"
			else
				git_branch=" → (unknow)"
			fi
			return
		fi
		dir="../$dir"
	done
	git_branch=''
}

# PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

# Here is bash color codes you can use
black=$'\[\e[1;30m\]'
red=$'\[\e[1;31m\]'
green=$'\[\e[1;32m\]'
yellow=$'\[\e[1;33m\]'
blue=$'\[\e[1;34m\]'
magenta=$'\[\e[1;35m\]'
cyan=$'\[\e[1;36m\]'
white=$'\[\e[1;37m\]'
normal=$'\[\e[m\]'

#PS1="$white[$magenta\u$white@$green\h$white:$cyan\w$yellow\$git_branch$white]\$ $normal"
PS1="[\u@\h \W$cyan\$(__git_ps1 \" (%s)\")$normal]\$ "
#-- show branch name begin --
