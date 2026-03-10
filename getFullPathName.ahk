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
class VersionManager_getFullPathName
{
    static _ := this._init()
    static _init()    {
        global
        GETFULLPATHNAME_VERSION := "1.0.0"
    }
}
getFullPathName(fileName)    {
    neededChars := dllCall("Kernel32.dll\GetFullPathNameW", "WStr",fileName, "UInt",0, "Ptr",0, "Ptr",0, "UInt")
    if (!neededChars)
        return fileName
    fullPathName := buffer(neededChars * 2, 0)
    copiedChars := dllCall("Kernel32.dll\GetFullPathNameW", "WStr",fileName, "UInt",neededChars, "Ptr",fullPathName.Ptr, "Ptr",0, "UInt")
    if (!copiedChars)
        return fileName
    return strGet(fullPathName, copiedChars, "UTF-16")
}