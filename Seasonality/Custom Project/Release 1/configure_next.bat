@echo off
setlocal enabledelayedexpansion
REM Define the currency tickers, months, and days arrays
set tickers=AUDCAD AUDCHF AUDJPY AUDNZD AUDUSD CADCHF CADJPY CHFJPY EURAUD EURCAD EURCHF EURGBP EURJPY EURNZD EURUSD GBPAUD GBPCAD GBPCHF GBPJPY GBPNZD GBPUSD NZDCAD NZDCHF NZDJPY NZDUSD USDCAD USDCHF USDJPY XAUUSD
set months=January February March April May June July August September October November December
set days=Monday Tuesday Wednesday Thursday Friday
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

REM Calculate the current ticker, month, and day index
set /a ticker_index=(%counter%-1)/60 + 1
set /a month_index=(%counter%-1)/5 %% 12 + 1
set /a day_index=(%counter%-1)%%5 + 1

REM Retrieve the current currency ticker
set i=1
for %%a in (%tickers%) do (
	if !i! equ %ticker_index% set ticker=%%a
	set /a i+=1
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

REM Get the current date and time
for /f "tokens=1-5 delims=/:. " %%d in ("%date% %time%") do (
	set datetime=%date% %time%
)

REM Define the source and destination paths for template
set src_folder=Templates\Long\%month%
set src_file=%src_folder%\%day%.sqx
set dest_folder=Working Folder
set dest_file=%dest_folder%\template_long.sqx

REM Create the destination folder if it doesn't exist
if not exist "%dest_folder%" (
	mkdir "%dest_folder%" >> %log_file%
)

REM Copy the template file
copy "%src_file%" "%dest_file%" /y >> %log_file%

REM Output some information
echo %datetime% Counter: %counter%  >> %log_file%
echo %datetime% Ticker: %ticker%  >> %log_file%
echo %datetime% Month: %month%  >> %log_file%
echo %datetime% Day: %day%  >> %log_file%
echo %datetime% File copied from %src_file% to %dest_file% >> %log_file%

REM Define the source and destination paths for template
set src_file=Configs\%ticker%.cfx
set dest_folder=Working Folder
set dest_file=%dest_folder%\ticker_config.cfx

REM Create the destination folder if it doesn't exist
if not exist "%dest_folder%" (
	mkdir "%dest_folder%" >> %log_file%
)

REM Copy the template file
copy "%src_file%" "%dest_file%" /y >> %log_file%


REM Output some information
echo %datetime% File copied from %src_file% to %dest_file% >> %log_file%
endlocal
