module PWM
(
	input logic clk, rst, dir, ud,
	input logic [15:0] ARR, CCR,
	output logic wave
);

	logic w, p_w, d, p_d;
	logic [15:0] c, p_c;

	always_ff @(posedge clk, posedge rst)
		if (rst)
			c <= 16'd0;
		else
			c <= p_c;

	always_ff @(posedge clk, posedge rst)
		if (rst)
			w <= 1'b1;
		else
			w <= p_w;
	
	always_ff @(posedge clk, posedge rst)
		if (rst)
			d <= 1'b1;
		else
			d <= p_d; 
			

	always_comb begin
		if (ud)
			p_d = d;
		else
			p_d = dir;
		
		if (d) begin
			if (c == ARR) begin
				if (ud) begin
					p_w = w;
					p_d = 1'b0;
					p_c = c;
				end else begin
					p_c = 16'd0;
					p_w = 1'b1;
				end
			end else begin
				p_c = c + 1;
				if (c == CCR)
					p_w = 1'b0;
				else
					p_w = w;
			end
		end else if (~d) begin
			if (c == 16'd0) begin
				p_w = 1'b1;
				if (ud) begin
					p_d = 1'b1;
					p_c = c;
				end else
					p_c = ARR;
			end else begin
				p_c = c - 1;
				if (c ==  CCR)
					p_w = ~w;
				else
					p_w = w;
			end
		end else begin
			p_c = c;
			p_w = w;
		end
	end

	assign wave = w;

endmodule
