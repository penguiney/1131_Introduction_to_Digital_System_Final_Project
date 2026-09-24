module stop_button (dot_clk1_div, f, reset_stopbutton, btn_left_is_pressed, btn_right_is_pressed, left_stop_spinning, right_stop_spinning);
	input f;
	input dot_clk1_div;
	input reset_stopbutton;
	input btn_left_is_pressed;
	input btn_right_is_pressed;
	output left_stop_spinning;
	output right_stop_spinning;

	reg left_stop_spinning;
	reg right_stop_spinning;
	
	always@ (posedge dot_clk1_div) begin
		if(btn_left_is_pressed == 1'd1) left_stop_spinning <= 1'd1;
		if(btn_right_is_pressed == 1'd1) right_stop_spinning <= 1'd1;
		
		if(f == 1'b1) begin
			left_stop_spinning <= 1'd0;
			right_stop_spinning <= 1'd0;
		end
		if(reset_stopbutton == 1'b1) begin
			left_stop_spinning <= 1'd0;
			right_stop_spinning <= 1'd0;
		end
	end
endmodule