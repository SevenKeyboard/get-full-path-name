#Requires AutoHotkey v1.1.0+
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
    bufferLength := dllCall("Kernel32.dll\GetFullPathName", "Str",fileName, "UInt",0, "Ptr",0, "Ptr",0, "UInt")
    ,varSetCapacity(buf, bufferLength * (A_IsUnicode ? 2 : 1), 0)
    ,dllCall("Kernel32.dll\GetFullPathName", "Str",fileName, "UInt",bufferLength, "Str",fullPath, "Ptr",0, "UInt")
    return fullPath
}