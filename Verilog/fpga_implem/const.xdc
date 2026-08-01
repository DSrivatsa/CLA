# Clock
set_property PACKAGE_PIN F14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0 5} [get_ports clk]

# a_in[4:0]
set_property PACKAGE_PIN V2  [get_ports {a_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[0]}]

set_property PACKAGE_PIN U2  [get_ports {a_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[1]}]

set_property PACKAGE_PIN U1  [get_ports {a_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[2]}]

set_property PACKAGE_PIN T2  [get_ports {a_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[3]}]

set_property PACKAGE_PIN T1  [get_ports {a_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[4]}]

# b_in[4:0]
set_property PACKAGE_PIN R2  [get_ports {b_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[0]}]

set_property PACKAGE_PIN R1  [get_ports {b_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[1]}]

set_property PACKAGE_PIN P2  [get_ports {b_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[2]}]

set_property PACKAGE_PIN P1  [get_ports {b_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[3]}]

set_property PACKAGE_PIN N2  [get_ports {b_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[4]}]

# sum_out[4:0]
set_property PACKAGE_PIN G1 [get_ports {sum_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum_out[0]}]
set_property SLEW SLOW [get_ports {sum_out[0]}]

set_property PACKAGE_PIN G2 [get_ports {sum_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum_out[1]}]
set_property SLEW SLOW [get_ports {sum_out[1]}]

set_property PACKAGE_PIN F1 [get_ports {sum_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum_out[2]}]
set_property SLEW SLOW [get_ports {sum_out[2]}]

set_property PACKAGE_PIN F2 [get_ports {sum_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum_out[3]}]
set_property SLEW SLOW [get_ports {sum_out[3]}]

set_property PACKAGE_PIN E1 [get_ports {sum_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum_out[4]}]
set_property SLEW SLOW [get_ports {sum_out[4]}]

# cout_out
set_property PACKAGE_PIN E2  [get_ports cout_out]
set_property IOSTANDARD LVCMOS33 [get_ports cout_out]
set_property SLEW SLOW [get_ports cout_out]
