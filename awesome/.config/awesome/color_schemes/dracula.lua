
--[[

Background 	   #282a36
Current Line 	 #44475a
Selection 	   #44475a
Foreground 	   #f8f8f2
Comment 	     #6272a4
Cyan 	         #8be9fd
Green 	       #50fa7b
Orange 	       #ffb86c
Pink 	         #ff79c6
Purple 	       #bd93f9
Red 	         #ff5555
Yellow 	       #f1fa8c
--]]





local scheme                                     = {}

scheme.fg_normal                                 = "#f8f8f2"
scheme.fg_focus                                  = "#f8f8f2"
scheme.blue                                      = "#8be9fd"
scheme.green                                     = "#50fa7b"
scheme.fg_urgent                                 = "#f1fa8c"
scheme.bg_normal                                 = "#282a36"
scheme.bg_focus                                  = "#44475a"
scheme.bg_urgent                                 = "#44475a"
scheme.border_normal                             = scheme.bg_urgent
scheme.border_focus                              = "#bd93f9"
scheme.border_marked                             = "#CC9393"
scheme.tasklist_bg_focus                         = scheme.bg_urgent
scheme.taglist_bg_focus                          = scheme.border_focus
scheme.taglist_fg_focus                          = scheme.bg_normal
scheme.taglist_bg_empty                          = scheme.bg_normal
scheme.taglist_fg_empty                          = scheme.bg_urgent
scheme.taglist_fg_urgent                         = scheme.bg_normal
scheme.taglist_bg_urgent                         = "#ff5555"
scheme.taglist_bg_occupied                       = scheme.bg_focus
scheme.titlebar_bg_focus                         = scheme.bg_focus
scheme.titlebar_bg_normal                        = scheme.bg_normal
scheme.titlebar_fg_focus                         = scheme.fg_focus
scheme.wibar_border_color                        = scheme.border_focus

return scheme
