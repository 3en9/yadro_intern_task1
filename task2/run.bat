iverilog -g2012 -o sim fulladder_sync.sv tb_fulladder_sync.sv
vvp sim

gtkwave wave.vcd