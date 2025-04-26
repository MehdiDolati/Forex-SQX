@echo off
setlocal enabledelayedexpansion

REM Define the tickers arrays
set tickers=AUDCAD AUDCHF AUDJPY AUDNZD AUDUSD CADCHF CADJPY CHFJPY EURAUD EURCAD EURCHF EURGBP EURJPY EURNZD EURUSD GBPAUD GBPCAD GBPCHF GBPJPY GBPNZD GBPUSD NZDCAD NZDCHF NZDJPY NZDUSD USDCAD USDCHF USDJPY XAUUSD

REM Initialize the counter file
set counter_file=.ticker_call_counter
set log_file=log_ticker.txt
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

set /a ticker_index=(%counter%)

REM Retrieve the current ticker
set i=1
for %%a in (%tickers%) do (
    if !i! equ %ticker_index% set ticker=%%a
    set /a i+=1
)

REM Define the source and destination paths
set src_file=Configs\%ticker%.cfx
set dest_folder=Working Folder
set dest_file=%dest_folder%\ticker_config.cfx

REM Create the destination folder if it doesn't exist
if not exist "%dest_folder%" (
    mkdir "%dest_folder%"
)

REM Copy the file
copy "%src_file%" "%dest_file%" /y  >> %log_file%

REM Output some information
echo %date% %time% File copied from %src_file% to %dest_file% >> %log_file%

endlocal