#!/bin/sh
./bin/openocd \
-s scripts	\
-f interface/cmsis-dap.cfg \
-c "transport select swd" \
-f target/efm32s2_g23.cfg \
-c init -c halt \
-c "reset run" \
-c exit