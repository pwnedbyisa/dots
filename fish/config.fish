if status is-interactive
    # theme
    fish_config theme choose 'Mono Lace'
    
    # full directories instead of first letter
    set fish_prompt_pwd_dir_length 0
    
    # disable default greeting
    set fish_greeting

    # basically nim prompt but without any of the features/ colors
    function fish_prompt
    echo -n '┬─ ['

    if functions -q fish_is_root_user; and fish_is_root_user
        set_color -o red
    end

    echo $USER@(prompt_hostname):(prompt_pwd)]

    # Background jobs
    for job in (jobs)
        echo -n '│ '
        echo $job
    end

    echo -n '╰─> $ '
    end
    
    function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
end
