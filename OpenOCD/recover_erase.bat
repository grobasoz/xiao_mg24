@echo off

:ask
echo.
echo Are you sure you want to recover? 
echo !!! All flash will be erased !!!
set "choice="
set /p choice="Press Y or Enter to continue or N to exit: "

if /i "%choice%"=="N" goto no
if /i "%choice%"=="Y" goto yes

:: If no input is provided, default to 'Y'
if "%choice%"=="" goto yes

goto ask

:no
goto end

:yes
@.\bin\openocd-efm32s2 -s scripts ^
	-f interface\cmsis-dap.cfg ^
	-c "transport select swd" ^
	-f target\efm32s2_g23.cfg ^
	-c init ^
	-c "reset_config srst_nogate" ^
	-c "reset halt" ^
	-c "flash erase_address 0x08000000 0x08180000" ^
	-c reset ^
	-c exit

:end

