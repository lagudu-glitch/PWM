`timescale 1us/10ns

module tb ();
	localparam T=10;
	logic tb_clk, tb_rst, tb_dir, tb_wave;
	logic [15:0] tb_ARR, tb_CCR;

	/*****************************************************/
	/* DUT                                               */
	/*****************************************************/
	PWM test (.clk(tb_clk), .rst(tb_rst), .dir(tb_dir),
		      .ARR(tb_ARR), .CCR(tb_CCR), .wave(tb_wave));
	
	/*****************************************************/
	/* CLOCK (100 KHz)                                   */
	/*****************************************************/
	always begin
		tb_clk = 1'b1;
		#(T/2);
		tb_clk = 1'b0;
		#(T/2);
	end

	/*****************************************************/
	/* RESET                                             */
	/*****************************************************/
	initial begin
		tb_rst = 1'b1;
		#T
		tb_rst = 1'b0;
	end

	/*****************************************************/
	/* TESTS                                             */
	/*****************************************************/
	initial begin

		// Wait for the reset to go low.
		#10
		$monitor("WAVE = %b", tb_wave);

		/*************************************************/
		/* TEST 1: COUNT UP                              */
		/*************************************************/
		tb_dir = 1;
		tb_ARR = 999;
		tb_CCR = 99;

		// Wait for 100 ms.
		#100000

		/*************************************************/
		/* TEST 2: COUNT DOWN                            */
		/*************************************************/
		tb_dir = 0;
		tb_ARR = 999;
		tb_CCR = 99;

		// Wait for 100 ms.
		#100000

		/*************************************************/
		/* TEST 3: 50% DUTY CYCLE (UP)                   */
		/*************************************************/
		tb_dir = 1;
		tb_ARR = 999;
		tb_CCR = 499;

		// Wait for 100 ms.
		#100000

		/*************************************************/
		/* TEST 4: 50% DUTY CYCLE (DOWN)                 */
		/*************************************************/
		tb_dir = 0;
		tb_ARR = 999;
		tb_CCR = 499;

		// Wait for 100 ms.
		#100000

		/*************************************************/
		/* TEST 5: DC (UP)                               */
		/*************************************************/
		tb_dir = 1;
		tb_ARR = 999;
		tb_CCR = 999;

		// Wait for 100 ms.
		#100000

		/*************************************************/
		/* TEST 6: DC (DOWN)                             */
		/*************************************************/
		tb_dir = 0;
		tb_ARR = 999;
		tb_CCR = 0;

		// Wait for 100 ms.
		#100000

		// Finish Simulation
		$display("TEST COMPLETE");
		$finish();
	end

	/*****************************************************/
	/* DUMP SIGNALS                                      */
	/*****************************************************/
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb);
	end

endmodule
