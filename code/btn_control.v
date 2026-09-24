module btn_control (btn_div, btn_col, btn_row, btn_left_is_pressed, btn_right_is_pressed);
	input btn_div;
	input [3:0] btn_col;
	output [3:0] btn_row;
	output reg btn_left_is_pressed;
	output reg btn_right_is_pressed;
	
	reg [3:0] btn_row;
	
	always@ (posedge btn_div) begin
		btn_row <= 4'b1110;
		case (btn_col)
			4'b0111: begin btn_left_is_pressed <= 1; btn_right_is_pressed <= 0; end
			4'b0011: begin btn_left_is_pressed <= 1; btn_right_is_pressed <= 0; end
			4'b0101: begin btn_left_is_pressed <= 1; btn_right_is_pressed <= 0; end
			4'b0001: begin btn_left_is_pressed <= 1; btn_right_is_pressed <= 0; end
			
			4'b1110: begin btn_left_is_pressed <= 0; btn_right_is_pressed <= 1; end
			4'b1100: begin btn_left_is_pressed <= 0; btn_right_is_pressed <= 1; end
			4'b1010: begin btn_left_is_pressed <= 0; btn_right_is_pressed <= 1; end
			4'b1000: begin btn_left_is_pressed <= 0; btn_right_is_pressed <= 1; end
			
			4'b0110: begin btn_left_is_pressed <= 1; btn_right_is_pressed <= 1; end
			4'b0010: begin btn_left_is_pressed <= 1; btn_right_is_pressed <= 1; end
			4'b0100: begin btn_left_is_pressed <= 1; btn_right_is_pressed <= 1; end
			4'b0000: begin btn_left_is_pressed <= 1; btn_right_is_pressed <= 1; end
			
			default: begin btn_left_is_pressed <= 0; btn_right_is_pressed <= 0; end
		endcase		
	end
endmodule

module btn_clk_div (clk, btn_div);
	input clk;
	output btn_div;
				
	reg btn_div;
	reg [20:0] btn_count;
	
	always@(posedge clk) begin			
		if(btn_count == 20'd249999) begin
			btn_count <= 20'd0;
			btn_div <= ~btn_div;
		end
		else begin
			btn_count <= btn_count + 20'd1;
		end
	end	
endmodule