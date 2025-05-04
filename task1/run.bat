iverilog -g2012 -o sim scr_1dim_core.sv tb_scr_1dim_core.sv
vvp sim

gtkwave wave.vcd
