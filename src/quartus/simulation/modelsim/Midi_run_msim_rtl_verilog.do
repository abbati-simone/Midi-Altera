transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules {/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules/binary2bcd.v}
vlog -vlog01compat -work work +incdir+/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules {/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules/counter_display.v}
vlog -vlog01compat -work work +incdir+/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules {/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules/pll.v}
vlog -vlog01compat -work work +incdir+/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules {/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules/display_top.v}
vlog -vlog01compat -work work +incdir+/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules {/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules/playnote.v}
vlog -vlog01compat -work work +incdir+/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules {/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules/notes_sequence.v}
vlog -vlog01compat -work work +incdir+/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules {/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/modules/delay_unit.v}
vlog -vlog01compat -work work +incdir+/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/quartus/db {/home/abbakus/2ndhome/abbakus/Develop/src/Midi-Altera/src/quartus/db/pll_altpll.v}

