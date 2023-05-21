require'nvim-web-devicons'.setup {
    color_icons = true;
}

-- custom folder icon
require'nvim-web-devicons'.set_icon({
    lir_folder_icon = {
        icon = "",
        color = "#7ebae4",
        name = "LirFolderNode"
    }, 
    txt = {
        icon = "",
        name = "txt"
    }
})
