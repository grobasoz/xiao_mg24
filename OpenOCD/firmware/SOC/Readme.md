## Open OCD Interface with XIAO_MG24

### Windows Batch Commands


* ident-device (Identify the device)
 
* flash_code "firmware\\<flash_file>.hex"
 
* verify_code "firmware\\<flash_file>.hex"
 
* reset_run

* recover_erase (Warning! All code will be erased!)

* debug (then run gdb etc)

#### Notes:
Firmware can be placed anywhere but I just use the firmware folder for some examples.

With the XIAO MG24, pin D0 (Port C0) can be used to interrupt Deep Sleep.
When **pulled low** this prevents Deep Sleep allowing new code to be flashed.
