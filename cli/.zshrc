# Only interactive sessions
[[ $- != *i* ]] && return

if [ -d ~/.zshrc.d/ ] ; then
    for f in ~/.zshrc.d/?*.zsh ; do
        [ -x "$f" ] && . "$f"
    done
fi
