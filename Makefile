src = PWM.sv
tb = tb.sv
sim = sim.vvp
dump = dump.vcd

build: $(src) $(tb)
	iverilog -g2012 -o $(sim) $(src) $(tb)

verify: $(sim)
	vvp $(sim)
	gtkwave $(dump)

clean: $(sim) $(dump)
	rm -f $(sim) $(dump)

.PHONY: test verify clean
