# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

function fish_prompt
    set x "$status "
    if test $status -eq 0
       set x ""
    end
    printf '%s@%s %s%s%s%s%s> ' (whoami) (hostname) (echo $x) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (__fish_git_prompt)
end

function ll
    ls -lhaF $argv
end
