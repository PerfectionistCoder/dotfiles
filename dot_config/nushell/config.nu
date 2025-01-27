# history
$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 100_000
$env.config.history.isolation = true

# misc
$env.config.show_banner = false

$env.config.rm.always_trash = false
$env.config.recursion_limit = 50

# editor
# $env.config.edit_mode = "emacs"
$env.config.buffer_editor = "editor"

$env.config.cursor_shape.emacs = "inherit"       
$env.config.cursor_shape.vi_insert = "block"     
$env.config.cursor_shape.vi_normal = "underscore"

# completions 
$env.config.completions.algorithm = "prefix"
$env.config.completions.sort = "smart"
$env.config.completions.case_sensitive = false
$env.config.completions.quick = true
$env.config.completions.partial = true
$env.config.completions.use_ls_colors = true

$env.config.completions.external.enable = true
$env.config.completions.external.max_results = 50

# terminal integration
$env.config.use_kitty_protocol = true

$env.config.shell_integration.osc2 = true
$env.config.shell_integration.osc7 = true
$env.config.shell_integration.osc9_9 = false
$env.config.shell_integration.osc8 = true
$env.config.shell_integration.osc133 = false
$env.config.shell_integration.osc633 = false
$env.config.shell_integration.reset_application_mode = true

$env.config.bracketed_paste = true
$env.config.use_ansi_coloring = true

# error display
$env.config.error_style = "fancy"
$env.config.display_errors.exit_code = false
$env.config.display_errors.termination_signal = true

# table display
$env.config.footer_mode = "auto"
$env.config.table.mode = "ascii_rounded"
$env.config.table.index_mode = "auto"
$env.config.table.show_empty = false
$env.config.table.padding.left = 1
$env.config.table.padding.right = 1
$env.config.table.trim = {
  methodology: "wrapping"
  wrapping_try_keep_words: true
}
$env.config.table.header_on_separator = false
$env.config.table.abbreviated_row_count = null
$env.config.table.footer_inheritance = true

# datetime display
$env.config.datetime_format.table = null
$env.config.datetime_format.normal = "%m/%d/%y %I:%M:%S%p"

# filesize display
$env.config.filesize.metric = true
$env.config.filesize.format = "auto"

# misc display
$env.config.render_right_prompt_on_last_line = true
$env.config.float_precision = 2
$env.config.ls.use_ls_colors = false

# keybindings
source keybinds.nu

const menu_style = {
  text: "default"
  selected_text: "default_reverse"
  description_text: "yellow"
}
$env.config.menus = [
  {
    name: completion_menu
    only_buffer_difference: false 
    marker: ""                  
    type: {
        layout: columnar          
        columns: 4                
        col_width: 20             
        col_padding: 2            
    }
    style: $menu_style
  }
  {
    name: history_menu
    only_buffer_difference: true
    marker: ""
    type: {
        layout: list
        page_size: 10
    }
    style: $menu_style
  }
]

# theme
source theme.nu
