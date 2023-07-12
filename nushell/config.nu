let-env config = {
  ls: {
    use_ls_colors: true
    clickable_links: true
  }
  rm: {
    always_trash: false
  }
  cd: {
    abbreviations: true
  }
  table: {
    mode: rounded
    index_mode: always
    trim: {
      methodology: truncating
      truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
  }

  history: {
    max_size: 250
    sync_on_enter: true
    file_format: "plaintext"
  }
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "fuzzy"
    external: {
      enable: false
      max_results: 25
      completer: null
    }
  }
  filesize: {
    metric: true
    format: "auto"
  }
  use_grid_icons: true
  footer_mode: "25"
  float_precision: 2
  use_ansi_coloring: true
  shell_integration: true 
  show_banner: false
  render_right_prompt_on_last_line: false
}

source ~/.config/nushell/startup.nu
source ~/.cache/starship/init.nu
