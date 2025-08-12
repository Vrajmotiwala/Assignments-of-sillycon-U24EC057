## Create a clock constraint for 100 MHz clock
create_clock -name clk -period 10.000 [get_ports clk]
# 10 ns = 100 MHz, change according to your target frequency