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


