module rps_change(
	input clk_for_rps_left,
	input clk_for_rps_right,
	input reset,
	input left_stop_spinning,
	input right_stop_spinning,
	output reg [1:0] left_r_p_s,
	output reg [1:0] right_r_p_s
);
	
	always @(posedge clk_for_rps_left or negedge reset) begin
		if (~reset) begin
			left_r_p_s <= 2'd3;
		end else begin
			if(left_stop_spinning == 0) begin
				case(left_r_p_s)
					2'd0: left_r_p_s <= 2'd1;
					2'd1: left_r_p_s <= 2'd2;
					2'd2: left_r_p_s <= 2'd0;
					default: left_r_p_s <= 2'd0;
				endcase
			end
			else left_r_p_s <= left_r_p_s;
		end
	end
	
	always @(posedge clk_for_rps_right or negedge reset) begin
		if (~reset) begin
			right_r_p_s <= 2'd3;
		end else begin
			if(right_stop_spinning == 0) begin
				case(right_r_p_s)
					2'd0: right_r_p_s <= 2'd1;
					2'd1: right_r_p_s <= 2'd2;
					2'd2: right_r_p_s <= 2'd0;
					default: right_r_p_s <= 2'd0;
				endcase
			end
			else right_r_p_s <= right_r_p_s;
		end
	end
endmodule

module rpsclk_for_left(
	input clk,
	input reset,
	output reg clk_for_rps_left
);

	reg [16:0] count;
	
	always @(posedge clk or negedge reset) begin
		if(~reset)
		begin
			count <= 17'd0;
			clk_for_rps_left <= 1'b0;
		end
		else
		begin
			if(count == 17'd123456)
			begin
				count <= 17'd0;
				clk_for_rps_left <= ~clk_for_rps_left;
			end
			else
			begin
				count <= count + 17'd1;
			end
		end
	end

endmodule

module rpsclk_for_right(
	input clk,
	input reset,
	output reg clk_for_rps_right
);
	reg [19:0] count;
	
	always @(posedge clk or negedge reset) begin
		if(~reset)
		begin
			count <= 20'd0;
			clk_for_rps_right <= 1'b0;
		end
		else
		begin
			if(count == 20'd654321)
			begin
				count <= 20'd0;
				clk_for_rps_right <= ~clk_for_rps_right;
			end
			else
			begin
				count <= count + 20'd1;
			end
		end
	end
	
endmodule