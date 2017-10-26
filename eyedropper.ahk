; name: Eyedropper
; description: Get the color by your cursor.
; author: Gooosie
; github: https://github.com/gooosie/eyedropper
GUI -Caption -Resize +AlwaysOnTop +Border +ToolWindow
#Persistent
SetTimer, WatchCursor, 30
Return

WatchCursor:
MouseGetPos, xpos, ypos
PixelGetColor, color, %xpos%, %ypos%, Slow RGB
ToolTip, X: %xpos%`nY: %ypos%`n%color%
WinGetPos, tooltipx, tooltipy, tooltipw, tooltiph, ahk_class tooltips_class32
GUI, Color, %color%
winx := tooltipx
winy := tooltipy + tooltiph + 4
GUI, Show, x%winx% y%winy% w12 h12 NA
Return

^c::
MouseGetPos, xpos, ypos
PixelGetColor, color, %xpos%, %ypos%, Slow RGB
Clipboard := color
Return

^q::
ExitApp
