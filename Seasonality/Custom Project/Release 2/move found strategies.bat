@echo off
setlocal enabledelayedexpansion

REM Define the tickers arrays
set tickers=AUDCAD AUDCHF AUDJPY AUDNZD AUDUSD CADCHF CADJPY CHFJPY EURAUD EURCAD EURCHF EURGBP EURJPY EURNZD EURUSD GBPAUD GBPCAD GBPCHF GBPJPY GBPNZD GBPUSD NZDCAD NZDCHF NZDJPY NZDUSD USDCAD USDCHF USDJPY XAUUSD
set months=January February March April May June July August September October November December
set days=Monday Tuesday Wednesday Thursday Friday

REM Initialize the counter file
set counter_file=.call_counter
set log_file=log_mover.txt
cd /d %~dp0
REM Check if the counter file exists
if not exist %counter_file% (
	echo counter file does not exist >> %log_file%
    exit
)

REM Read the counter value from the file
set /p counter=<%counter_file%

REM Calculate the current ticker, month, and day index
set /a ticker_index=(%counter%-1)/120 + 1
set /a month_index=(%counter%-1)/10 %% 12 + 1
set /a day_index=(%counter%-1)/2%%5 + 1
set /a direction_value=(%counter%-1)%%2

if %direction_value% == 0 (
	set direction=Long
) else ( 
	set direction=Short
)
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

REM Retrieve the current ticker
set i=1
for %%a in (%tickers%) do (
    if !i! equ %ticker_index% set ticker=%%a
    set /a i+=1
)

REM Define the source and destination paths
set src_folder=Working Folder\Results\
set dest_folder=Working Folder\%ticker%\%month%\%day%\%direction%

set files_found=false
for %%f in ("%src_folder%\*") do (
    set files_found=true
    goto :found_files
)

:found_files
if "%files_found%"=="true" (
	REM Create the destination folder if it doesn't exist
	if not exist "%dest_folder%" (
		mkdir "%dest_folder%" >> %log_file%
	)
	REM Copy the file
	move "%src_folder%\*" "%dest_folder%\" >> %log_file%
	REM Output some information
	echo %date% %time% File copied from %src_folder% to %dest_folder% >> %log_file%
) else (
    echo %date% %time% No files found in %src_folder%, skipping folder creation. >> %log_file%
)

endlocal