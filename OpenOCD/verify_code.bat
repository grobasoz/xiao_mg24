@echo off
if "%1"=="" (
    echo No firmware hex file was provided!
		exit /b
)
if not exist "%1" (
		echo Firmware hex file was not found!
		exit /b
)

set hexfile=%1
set hexfileesc=%hexfile:\=\\%

:ask
echo.
echo Verify Image "%hexfileesc%"?
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
	-c "flash probe 0" ^
	-c "flash banks" ^
	-c "flash list" ^
	-c "flash verify_image %hexfileesc%" ^
	-c "reset run" ^
	-c exit

:end
