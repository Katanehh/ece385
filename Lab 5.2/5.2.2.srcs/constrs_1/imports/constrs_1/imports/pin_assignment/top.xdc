create_clock -period 10 [get_ports {Clk}]
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS25} [get_ports {Clk}]

set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS25} [get_ports {SW[0]}]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS25} [get_ports {SW[1]}]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS25} [get_ports {SW[2]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS25} [get_ports {SW[3]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS25} [get_ports {SW[4]}]
set_property -dict {PACKAGE_PIN D2 IOSTANDARD LVCMOS25} [get_ports {SW[5]}]
set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS25} [get_ports {SW[6]}]

set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS25} [get_ports {SW[7]}]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS25} [get_ports {SW[8]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS25} [get_ports {SW[9]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS25} [get_ports {SW[10]}]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS25} [get_ports {SW[11]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS25} [get_ports {SW[12]}]
set_property -dict {PACKAGE_PIN A7 IOSTANDARD LVCMOS25} [get_ports {SW[13]}]
set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS25} [get_ports {SW[14]}]
set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS25} [get_ports {SW[15]}]

set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS25} [get_ports {Reset}]
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS25} [get_ports {Run}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS25} [get_ports {Continue}]

set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS25} [get_ports {hex_grid[0]}]
set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS25} [get_ports {hex_grid[1]}]
set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS25} [get_ports {hex_grid[2]}]
set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS25} [get_ports {hex_grid[3]}]
set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS25} [get_ports {hex_seg[0]}];  # CA
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS25} [get_ports {hex_seg[1]}];  # CB
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS25} [get_ports {hex_seg[2]}];  # CC
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS25} [get_ports {hex_seg[3]}];  # CD
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS25} [get_ports {hex_seg[4]}];  # CE
set_property -dict {PACKAGE_PIN D6 IOSTANDARD LVCMOS25} [get_ports {hex_seg[5]}];  # CF
set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS25} [get_ports {hex_seg[6]}];  # CG
set_property -dict {PACKAGE_PIN B5 IOSTANDARD LVCMOS25} [get_ports {hex_seg[7]}];  # CDP

set_property -dict {PACKAGE_PIN E4 IOSTANDARD LVCMOS25} [get_ports {hex_gridB[0]}]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS25} [get_ports {hex_gridB[1]}]
set_property -dict {PACKAGE_PIN F5 IOSTANDARD LVCMOS25} [get_ports {hex_gridB[2]}]
set_property -dict {PACKAGE_PIN H5 IOSTANDARD LVCMOS25} [get_ports {hex_gridB[3]}]
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS25} [get_ports {hex_segB[0]}];  # CA
set_property -dict {PACKAGE_PIN G5 IOSTANDARD LVCMOS25} [get_ports {hex_segB[1]}];  # CB
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS25} [get_ports {hex_segB[2]}];  # CC
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS25} [get_ports {hex_segB[3]}];  # CD
set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS25} [get_ports {hex_segB[4]}];  # CE
set_property -dict {PACKAGE_PIN H3 IOSTANDARD LVCMOS25} [get_ports {hex_segB[5]}];  # CF
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS25} [get_ports {hex_segB[6]}];  # CG
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS25} [get_ports {hex_segB[7]}];  # CDP


set_property -dict {PACKAGE_PIN C13 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[0]}]
set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[1]}]
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[2]}]
set_property -dict {PACKAGE_PIN D15 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[3]}]
set_property -dict {PACKAGE_PIN D16 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[4]}]
set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[5]}]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[6]}]
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[7]}]
                                                                        
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[8]}]
set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[9]}]
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[10]}]
set_property -dict {PACKAGE_PIN B17 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[11]}]
set_property -dict {PACKAGE_PIN C18 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[12]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[13]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[14]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS25} [get_ports {LED_OUT[15]}]