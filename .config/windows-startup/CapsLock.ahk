#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Autohotkey Capslock Remapping Script 
; - Deactivates capslock for normal (accidental) use.
; - Hold Capslock and drag anywhere in a window to move it (not just the title bar).
; - Access the following functions when pressing Capslock: 
    ;Cursor keys        - h, j, k, l
    ;Home,End           - N, ;
    ;Page up,down       - - =
    ;Esc                - CapsLock only
    ;CapsLock           - Space

#Persistent
SetCapsLockState, AlwaysOff

; Capslock + hjkl (left, down, up, right)
Capslock & h::Send {Blind}{Left DownTemp}
Capslock & h up::Send {Blind}{Left Up}

Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}

Capslock & k::Send {Blind}{Up DownTemp}
Capslock & k up::Send {Blind}{Up Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}


; Capslock + n (home, end)
;Capslock & n::SendInput {Blind}{Home Down}
;Capslock & n up::SendInput {Blind}{Home Up}
;
;Capslock & `;::SendInput {Blind}{End Down}
;Capslock & `; up::SendInput {Blind}{End Up}


Capslock & Space::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else 
    SetCapsLockState, AlwaysOn
Return


; Capslock only, Send Escape
CapsLock::Send, {ESC}

; Capslock + b, open the gitbash
;CapsLock & s::Send +{F10},Send s

;\ to |, <+\ to \
;\::+\
;Shift & \::Send {\}


; Application Launches
CapsLock & g::
    ifWinExist ahk_exe brave.exe
        winactivate ahk_exe brave.exe
    else
        Run C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe
    WinWait ahk_exe brave.exe
    WinActivate ahk_exe brave.exe
    WinWaitActive ahk_exe brave.exe
return

CapsLock & s::
    ifWinExist ahk_exe Spotify.exe
        winactivate ahk_exe Spotify.exe
    else
        Run C:\Users\udash\AppData\Roaming\Spotify\Spotify.exe
    WinWait ahk_exe Spotify.exe
    WinActivate ahk_exe Spotify.exe
    WinWaitActive ahk_exe Spotify.exe
return

CapsLock & e::
    ifWinExist ahk_exe explorer.exe
        winactivate ahk_exe explorer.exe
    else
        Run C:\Windows\explorer.exe
    WinWait ahk_exe explorer.exe
    WinActivate ahk_exe explorer.exe
    WinWaitActive ahk_exe explorer.exe
return

CapsLock & r::
    ifWinExist ahk_exe WindowsTerminal.exe
        winactivate ahk_exe WindowsTerminal.exe
    else
        Run wt.exe
    WinWait ahk_exe WindowsTerminal.exe
    WinActivate ahk_exe WindowsTerminal.exe
    WinWaitActive ahk_exe WindowsTerminal.exe
return


; Capslock + -= ,send up,down
;Capslock & =::SendInput {Blind}{PgDn Down}
;Capslock & = up::SendInput {Blind}{PgDn Up}
;Capslock & -::SendInput {Blind}{PgUp Down}
;Capslock & - up::SendInput {Blind}{PgUp Up}

;Caplock & p , Send click
;Capslock & p::Send +{Click 600, 200}

;Capslock & q ==> win  down
;Capslock & q::SendInput #{Down}

;Capslock & ` ==> win up
;Capslock & `::SendInput #{up}

;Capslock & Tab ==> Alt Tab
;Capslock & Tab::SendInput !{Tab}
