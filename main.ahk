#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, force ; disable running script when it's already running
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; further possible shortcuts
; =============
; horizontal scroll - copy paste didn't work
; set up desktops/environments/programs after startup
; move window to different desktop


; keys - https://www.autohotkey.com/docs/KeyList.htm
;! alt
;# winkey
;^ ctrl


; ctr + f highlighted text
#f::
  Send ^c
  Send ^f
  sleep, 100
  Send ^v
  Send {Enter}
  return

; YouTube
!x::Send >>>>
!z::Send <<<<
F19::Send >>>>
F20::Send <<<<


; Sites
#y::Run, www.youtube.com
#m::Run, www.messenger.com
; # & Shift & w::Run, www.web.whatsapp.com

; take a url from youtube music and open it in youtube
; https://music.youtube.com/watch?...
#!y::
    Send ^l
    sleep, 50
    Send ^c
    sleep, 50
    StringReplace, Clipboard, Clipboard, music., , All
    Send ^t
    sleep, 50
    Send ^v
    sleep, 100
    Send {Enter}
    return


; search highlighted text
#s::
    Send ^c
    Run % "http://www.google.com/search?q=" Clipboard
    return

; media
!;::Send {Volume_Down}
F13::Send {Volume_Down}
!'::Send {Volume_Up}
F14::Send {Volume_Up}

F15::Send {Media_Next}
F16::Send {Media_Play_Pause}


; switch desktops
!a::Send ^#{Left}
!s::Send ^#{Right}
F17::Send ^#{Left}
F18::Send ^#{Right}



; highlight text from caret to home/end
RAlt & i::Send {Shift down}{Home}{Shift up}{CTRL down}{b}{CTRL up}
RAlt & o::Send {Shift down}{End}{Shift up}{CTRL down}{b}{CTRL up}


; only kind of works - go from.
; A(
;   1,
;   2
; )
; to A(1, 2)
RAlt & p::Send {Shift down}{Home}{Shift up}{BackSpace}{BackSpace}{Space}{Down}{Home}


; MOUSE BUTTON SHORTCUTS
; ======================
; F numbering
; F13 vol down
; F14 vol up
; F15 media next
; F16 media pause
; F17 desktop left
; F18 desktop right
; F19 youtube faster
; F20 youtube slower



; move current window between monitors
; copied from https://www.autohotkey.com/boards/viewtopic.php?t=64784

#Q::
MMPrimDPI := 1.0 ;DPI Scale of the primary monitor (divided by 100).
MMSecDPI := 1.0  ;DPI Scale of the secondary monitor (divided by 100).
SysGet, MMCount, MonitorCount
SysGet, MMPrimary, MonitorPrimary
SysGet, MMPrimLRTB, Monitor, MMPrimary
WinGetPos, MMWinGetX, MMWinGetY, MMWinGetWidth, MMWinGetHeight, A
MMDPISub := Abs(MMPrimDPI - MMSecDPI) + 1
;Second mon is off, window is lost, bring to primary
if ( (MMCount = 1) and !((MMWinGetX > MMPrimLRTBLeft + 20) and (MMWinGetX < MMPrimLRTBRight - 20) and (MMWinGetY > MMPrimLRTBTop + 20) and (MMWinGetY < MMPrimLRTBBottom - 20)) ){
    if ((MMPrimDPI - MMSecDPI) >= 0)
        MMWHRatio := 1 / MMDPISub
    Else
        MMWHRatio := MMDPISub
    MMWinMoveWidth := MMWinGetWidth * MMWHRatio
    MMWinMoveHeight := MMWinGetHeight * MMWHRatio
    WinMove, A,, 0, 0, MMWinMoveWidth, MMWinMoveHeight
    WinMove, A,, 0, 0, MMWinMoveWidth, MMWinMoveHeight ;Fail safe
    return
}
if (MMPrimary = 1)
    SysGet, MMSecLRTB, Monitor, 2
Else
    SysGet, MMSecLRTB, Monitor, 1
MMSecW := MMSecLRTBRight - MMSecLRTBLeft
MMSecH := MMSecLRTBBottom - MMSecLRTBTop
;Primary to secondary
if ( (MMWinGetX > MMPrimLRTBLeft - 20) and (MMWinGetX < MMPrimLRTBRight + 20) and (MMWinGetY > MMPrimLRTBTop - 20) and (MMWinGetY < MMPrimLRTBBottom + 20) ){
    if ( (MMSecW) and (MMSecH) ){ ;Checks if sec mon exists. Could have used MMCount instead: if (MMCount >= 2){}
        if ((MMSecDPI - MMPrimDPI) >= 0){
            MMWidthRatio := (MMSecW / A_ScreenWidth) / MMDPISub
            MMHeightRatio := (MMSecH / A_ScreenHeight) / MMDPISub
        }
        Else {
            MMWidthRatio := (MMSecW / A_ScreenWidth) * MMDPISub
            MMHeightRatio := (MMSecH / A_ScreenHeight) * MMDPISub            
        }
        MMWinMoveX := (MMWinGetX * MMWidthRatio) + MMSecLRTBLeft
        MMWinMoveY := (MMWinGetY * MMHeightRatio) + MMSecLRTBTop
        if (MMSecLRTBBottom - MMWinMoveY < 80) ;Check if window is going under taskbar and fixes it.
            MMWinMoveY -= 80
        MMWinMoveWidth := MMWinGetWidth * MMWidthRatio
        MMWinMoveHeight := MMWinGetHeight * MMHeightRatio
        WinMove, A,, MMWinMoveX, MMWinMoveY, MMWinMoveWidth, MMWinMoveHeight
        WinMove, A,, MMWinMoveX, MMWinMoveY, MMWinMoveWidth, MMWinMoveHeight
    }
} ;Secondary to primary
Else if ( (MMWinGetX > MMSecLRTBLeft - 20) and (MMWinGetX < MMSecLRTBRight + 20) and (MMWinGetY > MMSecLRTBTop - 20) and (MMWinGetY < MMSecLRTBBottom + 20) ){
    if ( (MMSecW) and (MMSecH) ){
        if ((MMPrimDPI - MMSecDPI) >= 0){
            MMWidthRatio := (A_ScreenWidth / MMSecW) / MMDPISub
            MMHeightRatio := (A_ScreenHeight / MMSecH) / MMDPISub
        }
        Else{
            MMWidthRatio := (A_ScreenWidth / MMSecW) * MMDPISub
            MMHeightRatio := (A_ScreenHeight / MMSecH) * MMDPISub
        }
        MMWinMoveX := (MMWinGetX - MMSecLRTBLeft) * MMWidthRatio
        MMWinMoveY := (MMWinGetY - MMSecLRTBTop) * MMHeightRatio
        if (MMPrimLRTBBottom - MMWinMoveY < 80)
            MMWinMoveY -= 80
        MMWinMoveWidth := MMWinGetWidth * MMWidthRatio
        MMWinMoveHeight := MMWinGetHeight * MMHeightRatio
        WinMove, A,, MMWinMoveX, MMWinMoveY, MMWinMoveWidth, MMWinMoveHeight
        WinMove, A,, MMWinMoveX, MMWinMoveY, MMWinMoveWidth, MMWinMoveHeight
    }
} ;If window is out of current monitors' boundaries or if script fails
Else{
    MsgBox, 4, MM, % "Current window is in " MMWinGetX " " MMWinGetY "`nDo you want to move it to 0,0?"
    IfMsgBox Yes
    WinMove, A,, 0, 0
}
return