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

; Sites
#y::Run, www.youtube.com
#m::Run, www.messenger.com


; MOUSE BUTTON SHORTCUTS
; ======================
; F numbering corresponds to button numbers
; F16 is G-Shift button

; switch desktops
F16 & F17::Send ^#{Left}
F16 & F18::Send ^#{Right}

; media
F14::Send {Volume_Down}
F15::Send {Volume_Up}
F17::Send {Media_Prev}
F18::Send {Media_Next}
F19::Send {Media_Play_Pause}


