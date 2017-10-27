; name: Eyedropper
; description: Get the color by your cursor.
; version: v1.1.0
; author: Gooosie
; github: https://github.com/gooosie/eyedropper
GUI -Caption -Resize +AlwaysOnTop +Border +ToolWindow
#Persistent
SetTimer, WatchCursor, 30
return

WatchCursor:
MouseGetPos, xpos, ypos
PixelGetColor, color, %xpos%, %ypos%, Slow RGB
colorRGB := HexToRGB(color)
ToolTip, %xpos%`, %ypos%`n%color%`n%colorRGB%
WinGetPos, tooltipx, tooltipy, tooltipw, tooltiph, ahk_class tooltips_class32
GUI, Color, %color%
winx := tooltipx
winy := tooltipy + tooltiph + 4
GUI, Show, x%winx% y%winy% w12 h12 NA
return

^h::
MouseGetPos, xpos, ypos
PixelGetColor, color, %xpos%, %ypos%, Slow RGB
Clipboard := color
return

^c::
MouseGetPos, xpos, ypos
PixelGetColor, color, %xpos%, %ypos%, Slow RGB
Clipboard := HexToRGB(color)
return

^q::
ExitApp

HexToRGB(color) {
    colorR := SubStr(color, 3, 2)
    colorG := SubStr(color, 5, 2)
    colorB := SubStr(color, 7, 2)
    colorR = 0x%colorR%
    colorG = 0x%colorG%
    colorB = 0x%colorB%
    SetFormat, IntegerFast, D
    colorR += 0
    SetFormat, IntegerFast, D
    colorG += 0
    SetFormat, IntegerFast, D
    colorB += 0
    colorRGB = %colorR%`, %colorG%`, %colorB%
    return colorRGB
}
