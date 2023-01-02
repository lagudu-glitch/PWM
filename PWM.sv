module PWM
(
	input logic clk, rst, dir,
	input logic [15:0] ARR, CRR,
	output logic wave
);

	logic w, p_w;
	logic [15:0] c, p_c;

	always_ff @(posedge clk, posedge rst)
		if (rst) begin
			c <= 16'd0;
		end else begin
			c <= p_c;
		end
	end

	
