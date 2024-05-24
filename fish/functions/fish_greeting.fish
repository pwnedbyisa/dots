function fish_greeting
    echo -en 'Hack the Planet <3\nUser   >> ' 
    echo (set_color cyan; whoami; set_color normal)
    echo -n 'IP     >> '
    echo (set_color cyan; hostname -I; set_color normal)
    echo -n 'Uptime >> '
    echo (set_color cyan; uptime | grep up | awk '{print $3}' | tr -d ','; set_color normal)
    echo
end
