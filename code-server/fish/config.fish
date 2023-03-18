# 2023-03-17 updated

# convenience abbreviations
abbr --add --global g 'git'

# default message

function fish_greeting
    echo Hello, World!
    echo The time is (set_color yellow; date +'%A %Y-%m-%d %T'; set_color normal) and this machine is called {$hostname} and the user is {$USER}
end