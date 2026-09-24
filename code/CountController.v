module CountController(count_clk_div, rst, status, who_win_the_round, who_win_the_game, game_end, change_status, pl_round, pl_game, pr_round, pr_game);
	input count_clk_div;
	input rst;
	input [1:0] status;
	input [1:0] who_win_the_round;
	input game_end;
	
	output reg who_win_the_game;
	output reg change_status;
	output reg [3:0] pl_round;
	output reg [3:0] pl_game;
	output reg [3:0] pr_round;
	output reg [3:0] pr_game;
	
	reg point_flag;


	always@(posedge count_clk_div) begin
		if(~rst) begin
				pl_round <= 4'd0;
				pl_game <= 4'd0;
				pr_round <= 4'd0;
				pr_game <= 4'd0;
				point_flag <= 1'b0;
			end
		else begin
			if(game_end == 0) begin
				case(status) // win or lose state
					2'b10: begin
						if(point_flag == 1'b0) begin
							point_flag <= 1'b1;
							case(who_win_the_round)
								2'b10: pl_round <= pl_round + 1;
								2'b01: pr_round <= pr_round + 1;
								default: begin
									pl_round <= pl_round;
									pr_round <= pr_round;
								end
							endcase
						end
						if(pl_round == 4'd10) begin
							change_status <= 1'd1;
							who_win_the_game <= 1'b0;
						end
						if(pr_round == 4'd10) begin
							change_status <= 1'd1;
							who_win_the_game <= 1'b1;
						end						
					end
					default: begin
						point_flag = 1'b0;
						pl_round <= pl_round;
						pr_round <= pr_round;
						pl_game <= pl_game;
						pr_game <= pr_game;
					end
				endcase
			end
			else begin		
				if(pl_round == 4'd10) pl_game <= pl_game + 4'd1;
				if(pr_round == 4'd10) pr_game <= pr_game + 4'd1;
				
				change_status <= 1'd0;
				pl_round <= 0;
				pr_round <= 0;
			end
		end
	end
endmodule

module count_clk_div (clk, count_clk_div);								// update 10/s
	input clk;
	output count_clk_div;
				
	reg count_clk_div;
	reg [29:0] count_clk_count;
	
	always@(posedge clk) begin			
		if(count_clk_count == 30'd200000) begin
			count_clk_count <= 30'd0;
			count_clk_div <= ~count_clk_div;
		end
		else begin
			count_clk_count <= count_clk_count + 30'd1;
		end
	end		
endmodule