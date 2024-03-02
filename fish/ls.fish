# in usr/share/fish/functions (moved og ls.fish to ls-fish.bak)
# getting rid of decorators
function ls
    command ls --color=auto $argv
end
