
function! airline#themes#fantastic#refresh()
  let s:colors = {
  \ "black": { "gui": "#24252A", "cterm": "0"   },
  \ "medium_gray": { "gui": "#373639", "cterm": "243" },
  \ "white": { "gui": "#F1F1F1", "cterm": "15"  },
  \ "light_black": { "gui": "#40424b", "cterm": "8"   },
  \ "lighter_black": { "gui": "#545454", "cterm": "240" },
  \ "subtle_black": { "gui": "#303030", "cterm": "236" },
  \ "gray": { "gui": "#999999", "cterm": "249" },
  \ "lighter_gray": { "gui": "#DDDDDD", "cterm": "251" },
  \ "lightest_gray": { "gui": "#E5E5E5", "cterm": "251" },
  \ "dark_red": { "gui": "#C30771", "cterm": "1"   },
  \ "red": { "gui": "#F4B2B1", "cterm": "1"   },
  \ "orange": { "gui": "#FFB79f", "cterm": "1"   },
  \ "dark_blue": { "gui": "#008EC4", "cterm": "4"   },
  \ "blue": { "gui": "#B6D6FD", "cterm": "153" },
  \ "dark_cyan": { "gui": "#A09EF8", "cterm": "14"  },
  \ "cyan": { "gui": "#C2C1FF", "cterm": "14"  },
  \ "dark_green": { "gui": "#10A778", "cterm": "2"   },
  \ "green": { "gui": "#5FD7A7", "cterm": "10"  },
  \ "dark_purple": { "gui": "#C2C1FF", "cterm": "14"  },
  \ "purple": { "gui": "#d49df5", "cterm": "14"  },
  \ "yellow": { "gui": "#FFDB9F", "cterm": "11"  },
  \ "dark_yellow": { "gui": "#A89C14", "cterm": "3"   },
  \ "foreground": { "gui": "#ABB2BF", "cterm": "145", "cterm16": "NONE" },
  \ "background": { "gui": "#282C34", "cterm": "235", "cterm16": "NONE" },
  \ "comment_grey": { "gui": "#5C6370", "cterm": "59", "cterm16": "7" },
  \ "gutter_fg_grey": { "gui": "#4B5263", "cterm": "238", "cterm16": "8" },
  \ "cursor_grey": { "gui": "#161821", "cterm": "236", "cterm16": "0" },
  \ "visual_grey": { "gui": "#40424b", "cterm": "237", "cterm16": "8" },
  \ "menu_grey": { "gui": "#40424b", "cterm": "237", "cterm16": "7" },
  \ "special_grey": { "gui": "#3B4048", "cterm": "238", "cterm16": "7" },
  \ "vertsplit": { "gui": "#40424b", "cterm": "59", "cterm16": "7" },
  \}

  " # Term
  let s:term_red = s:colors.red.cterm
  let s:term_green = s:colors.green.cterm
  let s:term_yellow = s:colors.yellow.cterm
  let s:term_blue = s:colors.blue.cterm
  let s:term_purple = s:colors.purple.cterm
  let s:term_white = s:colors.white.cterm
  let s:term_cursor_grey = s:colors.cursor_grey.cterm
  let s:term_visual_grey = s:colors.visual_grey.cterm

  " # Palette
  let g:airline#themes#fantastic#palette = {}

  " ## Accents
  let g:airline#themes#fantastic#palette.accents = {
        \ 'red': [ s:colors.red.gui, '', s:term_red, 0 ]
        \ }

  " ## Normal Mode
  let s:N1 = [ s:colors.cursor_grey.gui, s:colors.green.gui, s:term_cursor_grey, s:term_green ]
  let s:N2 = [ s:colors.white.gui, s:colors.visual_grey.gui, s:term_white, s:term_visual_grey ]
  let s:N3 = [ s:colors.green.gui, s:colors.cursor_grey.gui, s:term_green, s:term_cursor_grey ]
  let g:airline#themes#fantastic#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#fantastic#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  " ## Insert Mode
  let s:I1 = [ s:colors.cursor_grey.gui, s:colors.blue.gui, s:term_cursor_grey, s:term_blue ]
  let s:I2 = s:N2
  let s:I3 = [ s:colors.blue.gui, s:colors.cursor_grey.gui, s:term_blue, '' ]
  let g:airline#themes#fantastic#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#fantastic#palette.insert_modified = g:airline#themes#fantastic#palette.normal_modified

  " ## Replace Mode
  let s:R1 = [ s:colors.cursor_grey.gui, s:colors.red.gui, s:term_cursor_grey, s:term_red ]
  let s:R2 = s:N2
  let s:R3 = [ s:colors.red.gui, s:colors.cursor_grey.gui, s:term_red, '' ]
  let g:airline#themes#fantastic#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#fantastic#palette.replace_modified = g:airline#themes#fantastic#palette.normal_modified

  " ## Visual Mode
  let s:V1 = [ s:colors.cursor_grey.gui, s:colors.purple.gui, s:term_cursor_grey, s:term_purple ]
  let s:V2 = s:N2
  let s:V3 = [ s:colors.purple.gui, s:colors.cursor_grey.gui, s:term_purple, '' ]
  let g:airline#themes#fantastic#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#fantastic#palette.visual_modified = g:airline#themes#fantastic#palette.normal_modified

  " ## Inactive Mode
  let s:IA1 = [ s:colors.cursor_grey.gui, s:colors.white.gui, s:term_cursor_grey, s:term_white ]
  let s:IA2 = [ s:colors.white.gui, s:colors.visual_grey.gui, s:term_white, s:term_visual_grey ]
  let s:IA3 = s:N2
  let g:airline#themes#fantastic#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
  let g:airline#themes#fantastic#palette.inactive_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  " ## Warnings
  let s:WI = [ s:colors.cursor_grey.gui, s:colors.yellow.gui, s:term_cursor_grey, s:term_yellow ]
  let g:airline#themes#fantastic#palette.normal.airline_warning = [
       \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
       \ ]

  let g:airline#themes#fantastic#palette.normal_modified.airline_warning =
      \ g:airline#themes#fantastic#palette.normal.airline_warning

  let g:airline#themes#fantastic#palette.insert.airline_warning =
      \ g:airline#themes#fantastic#palette.normal.airline_warning

  let g:airline#themes#fantastic#palette.insert_modified.airline_warning =
      \ g:airline#themes#fantastic#palette.normal.airline_warning

  let g:airline#themes#fantastic#palette.visual.airline_warning =
      \ g:airline#themes#fantastic#palette.normal.airline_warning

  let g:airline#themes#fantastic#palette.visual_modified.airline_warning =
      \ g:airline#themes#fantastic#palette.normal.airline_warning

  let g:airline#themes#fantastic#palette.replace.airline_warning =
      \ g:airline#themes#fantastic#palette.normal.airline_warning

  let g:airline#themes#fantastic#palette.replace_modified.airline_warning =
      \ g:airline#themes#fantastic#palette.normal.airline_warning

  " ## Errors
  let s:ER = [ s:colors.cursor_grey.gui, s:colors.red.gui, s:term_cursor_grey, s:term_red ]
  let g:airline#themes#fantastic#palette.normal.airline_error = [
       \ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
       \ ]

  let g:airline#themes#fantastic#palette.normal_modified.airline_error =
      \ g:airline#themes#fantastic#palette.normal.airline_error

  let g:airline#themes#fantastic#palette.insert.airline_error =
      \ g:airline#themes#fantastic#palette.normal.airline_error

  let g:airline#themes#fantastic#palette.insert_modified.airline_error =
      \ g:airline#themes#fantastic#palette.normal.airline_error

  let g:airline#themes#fantastic#palette.visual.airline_error =
      \ g:airline#themes#fantastic#palette.normal.airline_error

  let g:airline#themes#fantastic#palette.visual_modified.airline_error =
      \ g:airline#themes#fantastic#palette.normal.airline_error

  let g:airline#themes#fantastic#palette.replace.airline_error =
      \ g:airline#themes#fantastic#palette.normal.airline_error

  let g:airline#themes#fantastic#palette.replace_modified.airline_error =
      \ g:airline#themes#fantastic#palette.normal.airline_error

endfunction

call airline#themes#fantastic#refresh()
