This is the setup scripts for the emulator of w4118.

To run the script, first clone this repo and in the repo directory, run:
```
chmod +x *.sh
./emu_setup.sh
```

The emulator will be ready shortly.

To run the emulator:
```
./run_emulator.sh
```

If you feel your emulator is too slow, you can adjust the RAM size with `-m` option:
```
./run_emulator.sh -m 1024
```
This will set the RAM size of the emulator to 1024MB. The valid input is from 128-4096, default to 2048.

If the emulator is still too slow or cause your VM or host stall, you can use `-c` option which will turn off the GUI of the emulator.

For more information, you can use `-h` option to show the help text.
