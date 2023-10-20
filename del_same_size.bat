@echo off
setlocal EnableDelayedExpansion

set "findsize=0"
set "path=c:\backup - Copy\"
set "count=0"

for /f "tokens=*" %%a in ('dir /b /a-d /s "%path%"') do (
  set "filesize=%%~za"
  if !filesize! EQU !findsize! (
    set /a "count+=1"
    echo Deleting "%%a" with size !filesize!...
    del "%%a"
  ) else (
    set "findsize=!filesize!"
    set "count=1"
  )
)

echo %count% file(s) with the same size has been deleted.

