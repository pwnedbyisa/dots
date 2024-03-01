if status is-interactive
    fish_config theme choose 'Mono Lace'
    set fish_prompt_pwd_dir_length 0

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

end
