function git
    if test "$argv[1]" = "reset"
        if test "$argv[2]" = "--hard"
            echo -e "\n$REDCommand not available$NC"
            echo -e "\nYou can do:\n"
            echo -e "\t$YELLOWgit rhardh <hash>$NC"
            echo -e "\t$YELLOWgit rhardn <relative number>$NC"
            echo -e "\nDon't forget that you can do:\n"
            echo -e "\t$GREENgit backup"
            echo -e "\t$GREENgit backupcheck\n"
            return
        elif test "$argv[2]" = "--soft"
            echo -e "\n$REDCommand not available$NC"
            echo -e "\nYou can do:\n"
            echo -e "\t$YELLOWgit rsofth <hash>$NC"
            echo -e "\t$YELLOWgit rsoftn <relative number>$NC"
            echo -e "\nDon't forget that you can do:\n"
            echo -e "\t$GREENgit backup"
            echo -e "\t$GREENgit backupcheck\n"
            return
        elif test "$argv[2]" = "--mixed"
            echo -e "\n$REDCommand not available$NC"
            echo -e "\nYou can do:\n"
            echo -e "\t$YELLOWgit rmixedh <hash>$NC"
            echo -e "\t$YELLOWgit rmixedn <relative number>$NC"
            echo -e "\nDon't forget that you can do:\n"
            echo -e "\t$GREENgit backup"
            echo -e "\t$GREENgit backupcheck\n"
            return
        end
    elif test "$argv[1]" = "commit" -o "$argv[1]" = "ct"
        if test "$argv[2]" = "--amend"
            echo -e "\n$REDCommand not available$NC"
            echo -e "\nYou can do:\n"
            echo -e "\t$YELLOWgit amend$NC\n"
            return
        end
    elif test "$argv[1]" = "stash" -o "$argv[1]" = "st"
        if test "$argv[2]" = "clear"
            echo -e "\n$REDCommand not available$NC"
            echo -e "\nYou can do:\n"
            echo -e "\t$YELLOWgit clear-confirmed$NC\n"
            return
        elif test "$argv[2]" = "-m"
            echo -e "\n\t$GREENUsing .gitcustom.sh NC\n\n"
            set hash (git log --oneline -1 | cut -d ' ' -f 1)
            git stash save "($hash) $argv[3]"
            return
        elif test "$argv[2]" = "save"
            set hash (git log --oneline -1 | cut -d ' ' -f 1)
            git stash save "($hash) $argv[3]"
        end
    end

    command git $argv
end

function build_prompt
    set user "$GREEN\u$NC"
    set date "$BLUE(date "+%Ths")$NC"
    set directory "$YELLOW\w$NC"
    if is_git_repository
        set git_branch "$BLUE($(git_current_branch))$NC"
    end
    set git_user (get_git_user)
    set data "$user $date $directory $git_branch $git_user\n\$ "
    set -g PS1 "$data"
end

function is_git_repository
    git rev-parse --is-inside-work-tree > /dev/null 2>&1
    and return 0
    or return 1
end

function git_current_branch
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

function get_git_user
    if is_git_repository
        set user_name_local (git config --local user.name)
        if test -n "$user_name_local"
            echo -e "$GREENlocal: $user_name_local$NC"
            return
        end
    end

    set user_name_global (git config --global user.name)
    if test -n "$user_name_global"
        echo -e "$GREENglobal: $user_name_global$NC"
        return
    end

    echo -e "$REDNot logged yet!$NC"
    return
end
