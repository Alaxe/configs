# Only interactive sessions
[[ $- != *i* ]] && return

if [ -d ~/.bashrc.d/ ] ; then
    for f in ~/.bashrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
fi
