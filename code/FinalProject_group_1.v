module FinalProject_group_1 (clk, powerbutton, btn_col, btn_row, dot_row, left_dot_col, right_dot_col, l_r, l_g, r_r, r_g, a, b, c, d, e, f, h, i);

	//for all clk
	input clk;
	wire btn_div;
	wire dot_clk1_div;
	wire dot_clk2_div;
	wire clk_status_div;
	wire clk_status_div2;
	wire clk_for_rps_left;
	wire clk_for_rps_right;
	wire count_clk_div;
	//for all reset
	
	input powerbutton;

	//btn_control
	input [3:0] btn_col;
	output [3:0] btn_row;
	wire btn_left_is_pressed;
	wire btn_right_is_pressed;

	//stop_button
	wire left_stop_spinning;
	wire right_stop_spinning;

	//dot_control
	output [7:0] dot_row;
	output [7:0] left_dot_col;
	output [7:0] right_dot_col;


	//countcontroller
	wire [3:0]pl_round;
	wire [3:0]pl_game;
	wire [3:0]pr_round;
	wire [3:0]pr_game;
	wire change_status;

	//sevenDisplay
	output [6:0] l_r;
	output [6:0] l_g;
	output [6:0] r_r;
	output [6:0] r_g;

	//setStatus
	wire [1:0] status;
	wire reset_stopbutton;
	wire game_end;

	//whowin
	wire [1:0] who_win_the_round;
	wire who_win_the_game;

	//rps_change
	wire [1:0] left_r_p_s;
	wire [1:0] right_r_p_s;
	
	//debug
	output a;
	output b;
	output c;
	output d;
	output e;
	input f;
	output h;
	output i;
	
	debug u_debug(.left_stop_spinning(left_stop_spinning), .right_stop_spinning(right_stop_spinning), .c(c), .d(d));
	debugg u_debugg(.btn_left_is_pressed(btn_left_is_pressed), .btn_right_is_pressed(btn_right_is_pressed), .a(a), .b(b));
	debuggg u_debuggg (.reset_stopbutton(reset_stopbutton), .e(e));
	debuggggg u_debuggggg(.status(status), .h(h), .i(i));
	
	btn_control u_btn_control (.btn_div(btn_div), .btn_col(btn_col), .btn_row(btn_row), .btn_left_is_pressed(btn_left_is_pressed), .btn_right_is_pressed(btn_right_is_pressed));
	btn_clk_div u_btn_clk_div (.clk(clk), .btn_div(btn_div));

	stop_button u_stop_button (.dot_clk1_div(dot_clk1_div), .f(f), .reset_stopbutton(reset_stopbutton), .btn_left_is_pressed(btn_left_is_pressed), .btn_right_is_pressed(btn_right_is_pressed), .left_stop_spinning(left_stop_spinning), .right_stop_spinning(right_stop_spinning));

	dot_clk1_div u_dot_clk1_div (.clk(clk), .dot_clk1_div(dot_clk1_div));
	dot_clk2_div u_dot_clk2_div (.clk(clk), .dot_clk2_div(dot_clk2_div));
	dot_control u_dot_control (.dot_clk1_div(dot_clk1_div), .dot_clk2_div(dot_clk2_div), .status(status), .who_win_the_round(who_win_the_round), .who_win_the_game(who_win_the_game), .left_r_p_s(left_r_p_s), .right_r_p_s(right_r_p_s), .dot_row(dot_row), .left_dot_col(left_dot_col), .right_dot_col(right_dot_col));

	CountController u_CountController(.count_clk_div(count_clk_div), .rst(powerbutton), .status(status), .who_win_the_round(who_win_the_round), .who_win_the_game(who_win_the_game), .game_end(game_end), .change_status(change_status), .pl_round(pl_round), .pl_game(pl_game), .pr_round(pr_round), .pr_game(pr_game));
	count_clk_div u_count_clk_div (clk, count_clk_div);	
	SevenDisplay u_SevenDisplay(.pl_round(pl_round), .pl_game(pl_game), .pr_round(pr_round), .pr_game(pr_game), .l_r(l_r), .l_g(l_g), .r_r(r_r), .r_g(r_g));

	clk_for_status u_clk_for_status(.clk(clk), .reset(powerbutton), .clk_div(clk_status_div));
	setStatus u_setStatus(.clk(clk_status_div), .left_stop_spinning(left_stop_spinning), .right_stop_spinning(right_stop_spinning), .change_status(change_status), .reset(powerbutton), .left_score(pl_round), .right_score(pr_round), .status(status), .reset_stopbutton(reset_stopbutton), .game_end(game_end));
	whowin u_whowin(.clk(dot_clk1_div), .status(status), .left_r_p_s(left_r_p_s), .right_r_p_s(right_r_p_s), .left_score(pl_round), .right_score(pr_round), .who_win_the_round(who_win_the_round));
	
	rpsclk_for_left u_rpsclk_for_left(.clk(clk), .reset(powerbutton), .clk_for_rps_left(clk_for_rps_left));
	rpsclk_for_right u_rpsclk_for_right(.clk(clk), .reset(powerbutton), .clk_for_rps_right(clk_for_rps_right));
	rps_change u_rps_change(.clk_for_rps_left(clk_for_rps_left), .clk_for_rps_right(clk_for_rps_right), .reset(powerbutton), .left_stop_spinning(left_stop_spinning), .right_stop_spinning(right_stop_spinning), .left_r_p_s(left_r_p_s), .right_r_p_s(right_r_p_s));
endmodule


module debug (left_stop_spinning, right_stop_spinning, c, d);
	input left_stop_spinning;
	input right_stop_spinning;
	output reg c;
	output reg d;
	always@ (left_stop_spinning, right_stop_spinning) begin
		if(left_stop_spinning == 1'd1) c = 1'd1;
		else c = 1'd0;
		if(right_stop_spinning == 1'd1) d = 1'd1;
		else d = 1'd0;		
	end
endmodule

module debugg (btn_left_is_pressed, btn_right_is_pressed, a, b);
	input btn_left_is_pressed;
	input btn_right_is_pressed;
	output reg a;
	output reg b;
	always@ (btn_left_is_pressed, btn_right_is_pressed) begin
		if(btn_left_is_pressed == 1'd1) a = 1'd1;
		else a = 1'd0;
		if(btn_right_is_pressed == 1'd1) b = 1'd1;
		else b = 1'd0;		
	end
endmodule

module debuggg (reset_stopbutton, e);
	input reset_stopbutton;
	output reg e;
	always@ (reset_stopbutton) begin
		if(reset_stopbutton == 1'd1) e = 1'd1;
		else e = 1'd0;	
	end
endmodule

module debugggg (change, g);
	input change;
	output reg g;
	always@ (change) begin
		if(change == 1'b0)g = 1'b0;
		else g = 1'b1;
	end
endmodule

module debuggggg (status, h, i);
	input [1:0] status;
	output reg h;
	output reg i;
	always@ (status) begin
		case(status)
			2'd0: begin
				h = 0; 
				i = 0;
			end
			2'd1: begin
				h = 0; 
				i = 1;
			end
			2'd2: begin
				h = 1; 
				i = 0;
			end
			2'd3: begin
				h = 1; 
				i = 1;
			end
		endcase
	end
endmodule











