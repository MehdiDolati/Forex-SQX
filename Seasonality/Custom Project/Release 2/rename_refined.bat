@echo off
setlocal enabledelayedexpansion
for %%f in ("* - Copy.*") do (
    REM Get the file name without the extension
    set "filename=%%~nf"
    
    REM Get the file extension
    set "extension=%%~xf"
    
    REM Replace "- Copy" with "_refined" in the file name
    set "newname=!filename: - Copy=_refined!!extension!"
    
    REM Debugging output
    echo Renaming "%%~f" to "!newname!"
    
    REM Rename the file
    ren "%%~f" "!newname!"
)
endlocal