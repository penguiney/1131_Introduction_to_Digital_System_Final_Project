module dot_control (dot_clk1_div, dot_clk2_div, status, who_win_the_round, who_win_the_game, left_r_p_s, right_r_p_s, dot_row, left_dot_col, right_dot_col);
	input dot_clk1_div;
	input dot_clk2_div;
	input [1:0] who_win_the_round;
	input who_win_the_game;
	input [1:0] left_r_p_s;
	input [1:0] right_r_p_s;
	input [1:0] status;
	output [7:0] dot_row;
	output [7:0] left_dot_col;
	output [7:0] right_dot_col;
	
	reg [7:0] dot_row;
	reg [7:0] left_dot_col;
	reg [7:0] right_dot_col;
	
	
	reg [2:0] row_count;
	reg [7:0] left_col_list [7:0];
	reg [7:0] right_col_list [7:0];
	
	always@ (posedge dot_clk2_div) begin
		case (status)
			2'd0: begin                        // dead code just to prevent latch
				left_col_list[0] <= 8'b10000001;
				left_col_list[1] <= 8'b01000010;
				left_col_list[2] <= 8'b00100100;
				left_col_list[3] <= 8'b00011000;
				left_col_list[4] <= 8'b00011000;
				left_col_list[5] <= 8'b00100100;
				left_col_list[6] <= 8'b01000010;
				left_col_list[7] <= 8'b10000001;
					
				right_col_list[0] <= 8'b00000000;
				right_col_list[1] <= 8'b00000000;
				right_col_list[2] <= 8'b00000000;
				right_col_list[3] <= 8'b00000000;
				right_col_list[4] <= 8'b00000000;
				right_col_list[5] <= 8'b00000000;
				right_col_list[6] <= 8'b00000000;
				right_col_list[7] <= 8'b00000000;	
				end
			2'd1: begin
				case (left_r_p_s)			                                                // rock - paper - scissor - none
					2'd0: begin
						left_col_list[0] <= 8'b00000000;
						left_col_list[1] <= 8'b00011000;
						left_col_list[2] <= 8'b00100100;
						left_col_list[3] <= 8'b01000010;
						left_col_list[4] <= 8'b01000010;
						left_col_list[5] <= 8'b00100100;
						left_col_list[6] <= 8'b00011000;
						left_col_list[7] <= 8'b00000000;
						end
					2'd1: begin
						left_col_list[0] <= 8'b11111111;
						left_col_list[1] <= 8'b10000001;
						left_col_list[2] <= 8'b10000001;
						left_col_list[3] <= 8'b10000001;
						left_col_list[4] <= 8'b10000001;
						left_col_list[5] <= 8'b10000001;
						left_col_list[6] <= 8'b10000001;
						left_col_list[7] <= 8'b11111111;
						end
					2'd2: begin
						left_col_list[0] <= 8'b10000001;
						left_col_list[1] <= 8'b10000001;
						left_col_list[2] <= 8'b01000010;
						left_col_list[3] <= 8'b01000010;
						left_col_list[4] <= 8'b00100100;
						left_col_list[5] <= 8'b00100100;
						left_col_list[6] <= 8'b00011000;
						left_col_list[7] <= 8'b00011000;
						end
					2'd3: begin
						left_col_list[0] <= 8'b00000000;
						left_col_list[1] <= 8'b00000000;
						left_col_list[2] <= 8'b00000000;
						left_col_list[3] <= 8'b00000000;
						left_col_list[4] <= 8'b00000000;
						left_col_list[5] <= 8'b00000000;
						left_col_list[6] <= 8'b00000000;
						left_col_list[7] <= 8'b00000000;
						end
				endcase
				case (right_r_p_s)			                                                
					2'd0: begin
						right_col_list[0] <= 8'b00000000;
						right_col_list[1] <= 8'b00011000;
						right_col_list[2] <= 8'b00100100;
						right_col_list[3] <= 8'b01000010;
						right_col_list[4] <= 8'b01000010;
						right_col_list[5] <= 8'b00100100;
						right_col_list[6] <= 8'b00011000;
						right_col_list[7] <= 8'b00000000;
						end
					2'd1: begin
						right_col_list[0] <= 8'b11111111;
						right_col_list[1] <= 8'b10000001;
						right_col_list[2] <= 8'b10000001;
						right_col_list[3] <= 8'b10000001;
						right_col_list[4] <= 8'b10000001;
						right_col_list[5] <= 8'b10000001;
						right_col_list[6] <= 8'b10000001;
						right_col_list[7] <= 8'b11111111;
						end
					2'd2: begin
						right_col_list[0] <= 8'b10000001;
						right_col_list[1] <= 8'b10000001;
						right_col_list[2] <= 8'b01000010;
						right_col_list[3] <= 8'b01000010;
						right_col_list[4] <= 8'b00100100;
						right_col_list[5] <= 8'b00100100;
						right_col_list[6] <= 8'b00011000;
						right_col_list[7] <= 8'b00011000;
						end
					2'd3: begin
						right_col_list[0] <= 8'b00000000;
						right_col_list[1] <= 8'b00000000;
						right_col_list[2] <= 8'b00000000;
						right_col_list[3] <= 8'b00000000;
						right_col_list[4] <= 8'b00000000;
						right_col_list[5] <= 8'b00000000;
						right_col_list[6] <= 8'b00000000;
						right_col_list[7] <= 8'b00000000;
						end
				endcase	
			end
			2'd2: begin	
				case(who_win_the_round)
					2'd2: begin
						left_col_list[0] <= 8'b00000000;
						left_col_list[1] <= 8'b01000010;
						left_col_list[2] <= 8'b10100101;
						left_col_list[3] <= 8'b00000000;
						left_col_list[4] <= 8'b00000000;
						left_col_list[5] <= 8'b11111111;
						left_col_list[6] <= 8'b01000010;
						left_col_list[7] <= 8'b00111100;
						
						right_col_list[0] <= 8'b00000000;
						right_col_list[1] <= 8'b00000000;
						right_col_list[2] <= 8'b00000000;
						right_col_list[3] <= 8'b00000000;
						right_col_list[4] <= 8'b00000000;
						right_col_list[5] <= 8'b00000000;
						right_col_list[6] <= 8'b00000000;
						right_col_list[7] <= 8'b00000000;
						end
					2'd1: begin
						right_col_list[0] <= 8'b00000000;
						right_col_list[1] <= 8'b01000010;
						right_col_list[2] <= 8'b10100101;
						right_col_list[3] <= 8'b00000000;
						right_col_list[4] <= 8'b00000000;
						right_col_list[5] <= 8'b11111111;
						right_col_list[6] <= 8'b01000010;
						right_col_list[7] <= 8'b00111100;
						
						left_col_list[0] <= 8'b00000000;
						left_col_list[1] <= 8'b00000000;
						left_col_list[2] <= 8'b00000000;
						left_col_list[3] <= 8'b00000000;
						left_col_list[4] <= 8'b00000000;
						left_col_list[5] <= 8'b00000000;
						left_col_list[6] <= 8'b00000000;
						left_col_list[7] <= 8'b00000000;
						end
					default: begin
						right_col_list[0] <= 8'b00000000;
						right_col_list[1] <= 8'b01000010;
						right_col_list[2] <= 8'b10100101;
						right_col_list[3] <= 8'b00000000;
						right_col_list[4] <= 8'b00000000;
						right_col_list[5] <= 8'b11111111;
						right_col_list[6] <= 8'b01000010;
						right_col_list[7] <= 8'b00111100;
						
						left_col_list[0] <= 8'b00000000;
						left_col_list[1] <= 8'b01000010;
						left_col_list[2] <= 8'b10100101;
						left_col_list[3] <= 8'b00000000;
						left_col_list[4] <= 8'b00000000;
						left_col_list[5] <= 8'b11111111;
						left_col_list[6] <= 8'b01000010;
						left_col_list[7] <= 8'b00111100;
						end
				endcase
			end
			2'd3: begin	
				if(who_win_the_game == 0) begin
					left_col_list[0] <= 8'b01111110;
					left_col_list[1] <= 8'b01000010;
					left_col_list[2] <= 8'b01000010;
					left_col_list[3] <= 8'b00100100;
					left_col_list[4] <= 8'b00100100;
					left_col_list[5] <= 8'b00011000;
					left_col_list[6] <= 8'b00011000;
					left_col_list[7] <= 8'b01111110;
					
					right_col_list[0] <= 8'b00000000;
					right_col_list[1] <= 8'b00000000;
					right_col_list[2] <= 8'b00000000;
					right_col_list[3] <= 8'b00000000;
					right_col_list[4] <= 8'b00000000;
					right_col_list[5] <= 8'b00000000;
					right_col_list[6] <= 8'b00000000;
					right_col_list[7] <= 8'b00000000;
				end
				else begin
					right_col_list[0] <= 8'b01111110;
					right_col_list[1] <= 8'b01000010;
					right_col_list[2] <= 8'b01000010;
					right_col_list[3] <= 8'b00100100;
					right_col_list[4] <= 8'b00100100;
					right_col_list[5] <= 8'b00011000;
					right_col_list[6] <= 8'b00011000;
					right_col_list[7] <= 8'b01111110;
					
					left_col_list[0] <= 8'b00000000;
					left_col_list[1] <= 8'b00000000;
					left_col_list[2] <= 8'b00000000;
					left_col_list[3] <= 8'b00000000;
					left_col_list[4] <= 8'b00000000;
					left_col_list[5] <= 8'b00000000;
					left_col_list[6] <= 8'b00000000;
					left_col_list[7] <= 8'b00000000;
				end
			end
		endcase
	end
	                                                            
	always@ (posedge dot_clk1_div) begin								// will present col_list whatever	
			row_count <= row_count + 1;
			case (row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case (row_count)
				3'd0: left_dot_col <= left_col_list[0];
				3'd1: left_dot_col <= left_col_list[1];
				3'd2: left_dot_col <= left_col_list[2];
				3'd3: left_dot_col <= left_col_list[3];
				3'd4: left_dot_col <= left_col_list[4];
				3'd5: left_dot_col <= left_col_list[5];
				3'd6: left_dot_col <= left_col_list[6];
				3'd7: left_dot_col <= left_col_list[7];
			endcase
			case (row_count)
				3'd0: right_dot_col <= right_col_list[0];
				3'd1: right_dot_col <= right_col_list[1];
				3'd2: right_dot_col <= right_col_list[2];
				3'd3: right_dot_col <= right_col_list[3];
				3'd4: right_dot_col <= right_col_list[4];
				3'd5: right_dot_col <= right_col_list[5];
				3'd6: right_dot_col <= right_col_list[6];
				3'd7: right_dot_col <= right_col_list[7];
			endcase
	end
endmodule

module dot_clk1_div (clk, dot_clk1_div);								// update dot martix 1000/s
	input clk;
	output dot_clk1_div;
				
	reg dot_clk1_div;
	reg [19:0] dot_clk1_count;
	
	always@(posedge clk) begin			
		if(dot_clk1_count == 20'd24999) begin
			dot_clk1_count <= 20'd0;
			dot_clk1_div <= ~dot_clk1_div;
		end
		else begin
			dot_clk1_count <= dot_clk1_count + 20'd1;
		end
	end	
endmodule

module dot_clk2_div (clk, dot_clk2_div);								// update col list 10/s
	input clk;
	output dot_clk2_div;
				
	reg dot_clk2_div;
	reg [29:0] dot_clk2_count;
	
	always@(posedge clk) begin			
		if(dot_clk2_count == 30'd1249999) begin
			dot_clk2_count <= 30'd0;
			dot_clk2_div <= ~dot_clk2_div;
		end
		else begin
			dot_clk2_count <= dot_clk2_count + 30'd1;
		end
	end	
endmodule