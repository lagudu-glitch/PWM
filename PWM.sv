module PWM
(
	input logic clk, rst, dir,
	input logic [15:0] ARR, CCR,
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

	always_ff @(posedge clk, posedge rst)
		if (rst) begin
			w <= 1'b1;
		end else begin
			w <= p_w;
		end

	always_comb begin
		if (dir) begin
			if (c == ARR) begin
				p_c = 16'd0;
				p_w = 1'b1;
			end else begin
				p_c = c + 1;
				if (c == CCR) begin
					p_w = 1'b0;
				end else begin
					p_w = w;
				end
			end
		end else if (~dir) begin
			if (c == 16'd0) begin
				p_c = ARR;
				p_w = 1'b1;
			end else begin
				p_c = c - 1;
				if (c == CCR) begin
					p_w = 1'b0;
				end else begin
					p_w = w;
				end
			end
		end else begin
			p_c = c;
			p_w = w;
		end
	end

	assign wave = w;

endmodule
