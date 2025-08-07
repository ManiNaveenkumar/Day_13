iverilog -o ram.out tb_ram.v ram.v
vvp ram.out
gtkwave ram.vcd
