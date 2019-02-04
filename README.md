# Midi-Altera
Quartus project to play MIDI files on Altera FPGA (EP4CE6E22C8N on Zr-Tech WXEDA board)

This project implements logic to play MIDI file via my development board using the buzzer.

The script to extract ROMs from MIDI is copied from this project: https://github.com/abbati-simone/Midi-to-ROM

I used these modules on this project: https://github.com/abbati-simone/Yoshis-Nightmare-Altera

There are three Verilog modules:
* **playnote** module output a square wave of the appropriate frequency depending on the input note specified. The input clock should be 10 Mhz.
* **delay_unit** module input delay information and output a signal indicating when a pause is on.
* **top_module_Mario** module puts all togheter, instantiate the music ROM, mix the channels using a XOR and reset the ROMs index when the track end. Of course this is not the right way to mix channels, but if we want to use the onboard buzzer this is the only way I know to play two frequencies "at the same time".

To play the midi the step sequence is this:
Read current ROM word countaining note informations -> Start the delay of current note information and play the note of the previous word (if note was on) -> Read next ROM word.

PLL is configured to generate a 10Mhz clock for the *playnote* module, and another one to be used as "Tempo" for delay unit. When the delay is zero the next word of the ROM is read "immediately", that is on the next clock cycle, this is why the *delay_unit* clock is 1000 faster than the minimun clock frequency required to generate a delay of value 1. The clock for the *delay_unit* can be found inside *Parameters_Mario_General.vh* file (**parameter delay_clock_hz=6827000;**).

If you want to use the FPGA internal memory (MK9) the music ROMs modules should be created using Quartus IP catalog inside *Basic functions -> On Chip Memory -> ROM: one port*.
ROM parameters to be used are inside *Parameters_ROM_Mario_x.vh* file. The word size is *ROM_x_note_nbit + ROM_x_delay_nbit + 1* (one more bit because we have the note on/off information). The memory depth (number of words) can be found in *ROM_x_messages_len* parameter. The same informations are inside the MIF file (*WIDTH* and *DEPTH* parameters). Initialize the On Chip Memory with the appropriate MIF file.

Output recorded from my development board buzzer using ROMs extracted from *Mario-Sheet-Music-Overworld-Main-Theme.mid* file (partial):
![Output board buzzer record](https://github.com/abbati-simone/Midi-Altera/blob/master/doc/Output_board_buzzer_record.mp3 "Output board buzzer record")

Known problems, limitations and possible improvements
-----------------------------------------------------
Only midi files that are monotonic are supported (only one note at a time within a track is played).
It may be useful to modify these modules to play a ROM one-shot, this is necessary for example for a sound effect (like when Yoshi is hit, see projects linked above).
It is likely possible to give the channels a priority, that is to play the second channel only when the first channel is off at that moment.

