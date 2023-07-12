let-env LANG = "en_US.utf-8"
let-env EDITOR = "nvim"

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
