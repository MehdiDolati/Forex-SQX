@echo off
setlocal enabledelayedexpansion
REM Define the currency tickers, months, and days arrays
set tickers=AUDCAD AUDCHF AUDJPY AUDNZD AUDUSD CADCHF CADJPY CHFJPY EURAUD EURCAD EURCHF EURGBP EURJPY EURNZD EURUSD GBPAUD GBPCAD GBPCHF GBPJPY GBPNZD GBPUSD NZDCAD NZDCHF NZDJPY NZDUSD USDCAD USDCHF USDJPY XAUUSD
set log_file=log.txt

REM Initialize the counter file
set counter_file=.call_counter
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

REM Calculate the current ticker
set /a ticker_index=%counter%

REM Retrieve the current currency ticker
set i=1
for %%a in (%tickers%) do (
	if !i! equ %ticker_index% set ticker=%%a
	set /a i+=1
)

REM Get the current date and time
set datetime=%date% %time%

REM Output some information
echo %datetime% Counter: %counter%  >> %log_file%
echo %datetime% Ticker: %ticker%  >> %log_file%

REM Define the source and destination paths for template
set src_file=Configs\%ticker%.cfx
set dest_folder=Working Folder
set dest_file=%dest_folder%\ticker_config.cfx

REM Copy the template file
copy "%src_file%" "%dest_file%" /y >> %log_file%


REM Output some information
echo %datetime% Config file copied from %src_file% to %dest_file% >> %log_file%

REM Define the source and destination paths for template
set src_folder=..\Working Folder\%ticker%
set dest_folder=Working Folder\Source

if exist "%src_folder%" (
	del /q "%dest_folder%\"* >> %log_file%
	for /r "%src_folder%" %%f in (*) do (
        REM Get the file name and extension
        set "filename=%%~nf"
        set "extension=%%~xf"

        REM Get the current timestamp in YYYYMMDD_HHMMSS format
        for /f "tokens=1-2 delims=." %%a in ('wmic os get localdatetime ^| find "."') do (
            set datetime=%%a
        )
        set "uniqueid=!datetime:~0,8!_!datetime:~8,6!"

        REM Define the new file name with the unique identifier and original extension
        set "new_filename=!filename!_!uniqueid!!extension!"

        REM Copy the file with the new name
        copy "%%f" "%dest_folder%\!new_filename!" /Y >> %log_file%
    )
	echo %datetime% Strategies copied from %src_folder% to %dest_folder% >> %log_file%
) else (
	echo There are no strategies for %ticker% in %month%, skipping copy. >> %log_file%
)
endlocal