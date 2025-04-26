@echo off
setlocal enabledelayedexpansion

REM Define the months and days arrays
set months=January February March April May June July August September October November December
set days=Monday Tuesday Wednesday Thursday Friday

REM Initialize the counter file
set counter_file=.template_call_counter
set log_file=log_long.txt
cd /d %~dp0
REM Check if the counter file exists, if not create it
if not exist %counter_file% (
    echo 0 > %counter_file%
)

REM Read the counter value from the file
set /p counter=<%counter_file%

REM Increment the counter
set /a counter+=1

REM Save the new counter value to the file
echo %counter% > %counter_file%

REM Calculate the current month and day index
set /a month_index=(%counter%-1)/5 + 1
set /a day_index=(%counter%-1)%%5 + 1

REM Retrieve the current month
set i=1
for %%a in (%months%) do (
    if !i! equ %month_index% set month=%%a
    set /a i+=1
)

REM Retrieve the current day
set i=1
for %%a in (%days%) do (
    if !i! equ %day_index% set day=%%a
    set /a i+=1
)

REM Define the source and destination paths
set src_folder=Templates\Long\%month%
set src_file=%src_folder%\%day%.sqx
set dest_folder=Working Folder
set dest_file=%dest_folder%\template_long.sqx

REM Create the destination folder if it doesn't exist
if not exist "%dest_folder%" (
    mkdir "%dest_folder%"
)

REM Copy the file
copy "%src_file%" "%dest_file%" /y  >> %log_file%

REM Output some information
echo %date% %time% Counter: %counter% >> %log_file%
echo %date% %time% Month: %month% >> %log_file%
echo %date% %time% Day: %day% >> %log_file%
echo %date% %time% File copied from %src_file% to %dest_file% >> %log_file%

endlocal