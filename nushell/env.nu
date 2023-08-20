$env.LANG = "en_US.utf-8"
$env.EDITOR = "nvim"

alias ga = git add
alias gaa = git add .
alias gc = git commit
alias gp = git push
alias gpf = git push --force

alias gs = git stash
alias gsa = git stash apply

alias gch = git checkout


alias si = scoop install
alias su = scoop install


alias pwd = echo $env.PWD
alias cls = clear
alias n = nvim
alias v = vim
alias nf = neofetch


alias cfg = cd ~/.config


alias d_lua = cd ~\Workspace\Lua
alias d_ts = cd ~\Workspace\TypeScript
alias d_go = cd ~\Workspace\GoLang
alias d_ggc = cd ~\Workspace\GoLang\compilers\CompiGo
alias d_lazy = cd ~\AppData\Local\nvim-data\lazy
alias d_p = cd ~\Workspace

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
