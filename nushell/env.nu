let-env LANG = "en_US.utf-8"
let-env EDITOR = "nvim"

alias pwd = echo $env.PWD
alias cfg = cd $env.XDG_CONFIG_HOME
alias d_lua = cd C:\Programming\Lua
alias d_ts = cd C:\Programming\TypeScript
alias d_lazy = cd ~\AppData\Local\nvim-data\lazy

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
