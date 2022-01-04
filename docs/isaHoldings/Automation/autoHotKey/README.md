# Auto Hot Key

## 1. Some shortcuts

### 1.1 Keyboard shortcuts Matrix

```ahk
`hash`              #       Windows Key
`exclamation mark`  1       ALT
`caret`             ^       CTRL
`plus`              +       Shift
```

### 1.2 Run as Admin

Add the following to the top of your script to let it run in admin mode, so that it can support any apps

```ahk
if not A_IsAdmin
{
   Run, *RunAs %A_ScriptFullPath% ; Requires v1.0.92.01+
   ExitApp
}
```

## 2. Some Shortcut keys

### 2.1. Script to reload your scripts file

```ahk
^!ScrollLock::      ; CTRL + ALRT + Scroll Lock
Run, "C:\dev\autoHotKey\base.ahk"
Return
```


### 2.2. Auto Completing Passwords

```ahk
::pw::
SendInput *******
Return

::pwlo::
SendInput ********************
Return

::cof::
Send code-insiders -r 
Return
```

### 2.3 Open paths quickly in Windows

This will let you press CTRL + ALT + p (p for paths or whatever key you prefer).
Then releaseing all the keys and then pressing `a` to open `C:\Apps`, `d` to open `C:\Dev` etc
```ahk
!^p::      ; CTRL + ALT + p
input, command, L1
if command = a
Run, "C:\Apps"
if  command = d
Run, "C:\Dev"
if command = w
Run, "c:\laragon\www"
if command = o
Run, command = "c:\Users\charl\Downloads"
if command = s
Run, command = "c:\Software"
if command = h
Run, command = "c:\Windows\System32\drivers\etc"
if command = k
Run, command = "c:\dev\autoHotKey"
Return
```

