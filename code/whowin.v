module whowin(
	input clk,
	input [1:0] status,
	input [1:0] left_r_p_s,
	input [1:0] right_r_p_s,
	input [3:0] left_score,
	input [3:0] right_score,
	output reg [1:0] who_win_the_round
);

always @(posedge clk) begin
	if (status == 2'd2) begin
		case(left_r_p_s)
			2'd0: begin
				case(right_r_p_s)
					2'd1: who_win_the_round <= 2'd1;
					2'd2: who_win_the_round <= 2'd2;
					default: who_win_the_round <= 2'd0;
				endcase
			end
			2'd1: begin
				case(right_r_p_s)
					2'd0: who_win_the_round <= 2'd2;
					2'd2: who_win_the_round <= 2'd1;
					default: who_win_the_round <= 2'd0;
				endcase
			end
			2'd2: begin
				case(right_r_p_s)
					2'd0: who_win_the_round <= 2'd1;
					2'd1: who_win_the_round <= 2'd2;
					default: who_win_the_round <= 2'd0;
				endcase
			end
		endcase
	end
end
endmodule