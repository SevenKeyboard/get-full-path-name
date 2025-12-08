#Requires AutoHotkey v2.0.0+
;==============================================================
; GetFullPathName — Resolve a relative path to an absolute path using WinAPI
;
; GitHub: https://github.com/SevenKeyboard/get-full-path-name
; Author: SevenKeyboard Ltd. (2025)
; License: The Unlicense
;
; Documentation / References:
;   Re: Get Absolute path from relative path
;     https://www.autohotkey.com/boards/viewtopic.php?t=67050#p289536
;==============================================================
getFullPathName(fileName)    {
    bufferLength := dllCall("Kernel32.dll\GetFullPathNameW", "Str",fileName, "UInt",0, "Ptr",0, "Ptr",0, "UInt")
    ,buf := buffer(bufferLength * 2, 0)
    ,dllCall("Kernel32.dll\GetFullPathNameW", "Str",fileName, "UInt",bufferLength, "Ptr",buf.Ptr, "Ptr",0, "UInt")
    return strGet(buf) ;  fullPath
}