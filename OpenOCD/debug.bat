@.\bin\openocd-efm32s2 -s scripts ^
	-f interface\cmsis-dap.cfg ^
	-c "transport select swd" ^
	-f target\efm32s2_g23.cfg ^
	-c init ^
	-c halt ^
	-c reset
