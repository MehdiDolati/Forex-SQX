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
set /a ticker_index=(%counter%-1)/120 + 1
set /a month_index=(%counter%-1)/10 %% 12 + 1
set /a day_index=(%counter%-1)/2%%5 + 1
set /a direction_value=(%counter%-1)%%2

if %direction_value% == 0 (
	set direction=Long
) else ( 
	set direction=Short
)

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

set datetime=%date% %time%

REM Define the source and destination paths for templates
set src_folder=Templates\%direction%\%month%
set src_file_template=%src_folder%\%day%.sqx
set src_file_template_refined=%src_folder%\%day%_refined.sqx
set dest_folder=Working Folder
set dest_file_template=%dest_folder%\Template\template.sqx
set dest_file_template_refined=%dest_folder%\template_refined.sqx

REM Create the destination folder if it doesn't exist
if not exist "%dest_folder%" (
	mkdir "%dest_folder%" >> %log_file%
)

REM Copy the template files
copy "%src_file_template%" "%dest_file_template%" /y >> %log_file%
copy "%src_file_template_refined%" "%dest_file_template_refined%" /y >> %log_file%

REM Output some information
echo %datetime% Counter: %counter%  >> %log_file%
echo %datetime% Ticker: %ticker%  >> %log_file%
echo %datetime% Month: %month%  >> %log_file%
echo %datetime% Day: %day%  >> %log_file%
echo %datetime% Direction: %direction%  >> %log_file%
echo %datetime% File copied from %src_file_template% to %dest_file_template% >> %log_file%
echo %datetime% File copied from %src_file_template_refined% to %dest_file_template_refined% >> %log_file%


REM Define the source and destination paths for config
set src_file=Configs\%ticker%.cfx
set dest_folder=Working Folder
set dest_file=%dest_folder%\ticker_config.cfx

REM Create the destination folder if it doesn't exist
if not exist "%dest_folder%" (
	mkdir "%dest_folder%" >> %log_file%
)

REM Copy the config file
copy "%src_file%" "%dest_file%" /y >> %log_file%

REM Output some information
echo %datetime% File copied from %src_file% to %dest_file% >> %log_file%
endlocal