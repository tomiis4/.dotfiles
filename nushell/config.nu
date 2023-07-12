let-env config = {
    ls: {
        use_ls_colors: true
        clickable_links: true
    }
    rm: {
        always_trash: false
    }
    table: {
        mode: rounded
        index_mode: always
        trim: {
            methodology: truncating
            truncating_suffix: "..." 
        }
    }
    cursor_shape: {
        vi_insert: block
        vi_normal: block
        emacs: block
    }
    history: {
        max_size: 100
        sync_on_enter: true
        file_format: "plaintext"
    }
    filesize: {
        metric: true
        format: "auto"
    }
    footer_mode: "25"
    float_precision: 2
    use_ansi_coloring: true
    show_banner: false
}

source ~/.config/nushell/startup.nu
source ~/.cache/starship/init.nu
