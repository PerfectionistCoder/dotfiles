const theme = {
  rosewater: "#f4dbd6"
  flamingo: "#f0c6c6"
  pink: "#f5bde6"
  mauve: "#c6a0f6"
  red: "#ed8796"
  maroon: "#ee99a0"
  peach: "#f5a97f"
  yellow: "#eed49f"
  green: "#a6da95"
  teal: "#8bd5ca"
  sky: "#91d7e3"
  sapphire: "#7dc4e4"
  blue: "#8aadf4"
  lavender: "#b7bdf8"
  text: "#cad3f5"
  subtext1: "#b8c0e0"
  subtext0: "#a5adcb"
  overlay2: "#939ab7"
  overlay1: "#8087a2"
  overlay0: "#6e738d"
  surface2: "#5b6078"
  surface1: "#494d64"
  surface0: "#363a4f"
  base: "#24273a"
  mantle: "#1e2030"
  crust: "#181926"
}

const scheme = {
  command: $theme.blue
  unknown_command: { fg: $theme.red attr: u }
  constant: $theme.peach
  punctuation: $theme.overlay2
  operator: $theme.sky
  string: $theme.green
  virtual_text: $theme.surface2
  variable: { fg: $theme.flamingo attr: i }
  filepath: $theme.yellow
  custom: $theme.pink
  highlight: default_reverse
}


def getColorForValue [name] {
  const palette = [$theme.teal $theme.sky $theme.sapphire $theme.blue $theme.lavender $theme.mauve $theme.pink]
  const scale = {
    time: [1day 1wk 4wk 12wk 24wk 52wk]
    size: [1kb 10kb 100kb 10mb 100mb 1gb]
  }
  let values = $scale | get $name
  {||
    mut i = 0
    while $i < ($values | length) and ($values | get $i) < $in {
      $i += 1
    }
    $palette | get ([$i ($palette | length)] | math min)
  }
}

$env.config.highlight_resolved_externals = true
$env.config.color_config = {
  shape_string: $scheme.string
  shape_string_interpolation: $scheme.string
  shape_raw_string: { fg: $scheme.string attr: i }
  shape_record: $scheme.punctuation
  shape_list: $scheme.punctuation
  shape_table: $scheme.punctuation
  shape_bool: $scheme.constant
  shape_int: $scheme.constant
  shape_float: $scheme.constant
  shape_range: $scheme.operator
  shape_binary: $scheme.constant
  shape_datetime: $scheme.constant
  shape_custom: $scheme.custom
  shape_nothing: $scheme.constant
  # shape_literal: 
  shape_operator: $scheme.operator
  shape_filepath: $scheme.filepath
  shape_directory: $scheme.filepath
  shape_globpattern: $scheme.filepath
  shape_garbage: $scheme.unknown_command
  shape_variable: $scheme.variable
  shape_vardecl: $scheme.variable
  shape_matching_brackets: { attr: u }
  shape_pipe: $theme.pink
  shape_internalcall: { fg: $scheme.command }
  shape_external: $scheme.unknown_command
  shape_external_resolved: $scheme.command
  shape_externalarg: $theme.text
  shape_match_pattern: $theme.green
  shape_block: $scheme.command
  shape_signature: $theme.teal
  # shape_keyword: 
  shape_closure: $scheme.command
  shape_redirection: $scheme.operator
  shape_flag: { fg: $theme.maroon attr: i }

  # values
  string: $theme.text
  bool: {|| if $in { $theme.green } else { $theme.red } }
  int: $scheme.constant
  float: $scheme.constant
  glob: $scheme.filepath
  binary: $scheme.constant
  custom: $scheme.custom
  # nothing: 
  date: {|| (date now) - $in | do (getColorForValue time)}
  filesize: (getColorForValue size)
  # list: 
  # record: 
  duration: (getColorForValue time)
  range: $scheme.operator
  cell-path: $scheme.punctuation
  # closure: 
  # block: 
  
  # ui elements
  hints: $scheme.virtual_text
  search_result: $scheme.highlight
  header: { fg: $theme.text attr: b }
  separator: { fg: $theme.text attr: b }
  row_index: $scheme.virtual_text
  empty: { attr: n }
  leading_trailing_space_bg: { fg: $theme.subtext0 attr: u }
}
$env.config.explore = {
    status_bar_background: { fg: $theme.text, bg: $theme.mantle },
    command_bar_text: { fg: $theme.text },
    highlight: $scheme.highlight,
    status: {
        error: $theme.red,
        warn: $theme.yellow,
        info: $theme.blue,
    },
    selected_cell: { bg: $theme.blue fg: $theme.base },
}
