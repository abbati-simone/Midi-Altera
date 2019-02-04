#!/usr/bin/env bash

#Yoshi title
./Midi2ROM.py -f verilog -i midi/Yoshi_Title.mid -o verilog/ -p parameters/ -b 120 -n 1 -r Yoshi -t2
./Midi2ROM.py -f quartus -i midi/Yoshi_Title.mid -o mif/ -p parameters/ -b 120 -n 1 -r Yoshi -t2

#Yoshi play
./Midi2ROM.py -f verilog -i midi/Yoshi_Play.mid -o verilog/ -p parameters/ -b 84 -n 1 -r Yoshi2 -t1
./Midi2ROM.py -f quartus -i midi/Yoshi_Play.mid -o mif/ -p parameters/ -b 84 -n 1 -r Yoshi2 -t1

#Mario theme
./Midi2ROM.py -f verilog -i midi/Mario-Sheet-Music-Overworld-Main-Theme.mid -o verilog/ -p parameters/ -b 400 -n 1 -r Mario
./Midi2ROM.py -f quartus -i midi/Mario-Sheet-Music-Overworld-Main-Theme.mid -o mif/ -p parameters/ -b 400 -n 1 -r Mario

