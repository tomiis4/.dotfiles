let-env LANG = "en_US.utf-8"
let-env EDITOR = "nvim"

alias ga = git add
alias gaa = git add .
alias gc = git commit
alias gp = git push
alias gpf = git push --force

alias gs = git stash
alias gsa = git stash apply

alias gch = git checkout


alias pwd = echo $env.PWD
alias cls = clear
alias n = nvim


alias cfg = cd $env.XDG_CONFIG_HOME


alias d_lua = cd C:\Programming\Lua
alias d_ts = cd C:\Programming\TypeScript
alias d_lazy = cd ~\AppData\Local\nvim-data\lazy

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
