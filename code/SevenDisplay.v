module SevenDisplay(pl_round, pl_game, pr_round, pr_game, l_r, l_g, r_r, r_g);
  
input [3:0] pl_round;
input [3:0] pl_game;
input [3:0] pr_round;
input [3:0] pr_game;

output reg [6:0] l_r;
output reg [6:0] l_g;
output reg [6:0] r_r;
output reg [6:0] r_g;

always@(*) begin
	case(pl_round)
		4'd0: l_r <= 7'b1000000;
		4'd1: l_r <= 7'b1111001;
		4'd2: l_r <= 7'b0100100;
		4'd3: l_r <= 7'b0110000;
		4'd4: l_r <= 7'b0011001;
		4'd5: l_r <= 7'b0010010;
		4'd6: l_r <= 7'b0000010;
		4'd7: l_r <= 7'b1111000;
		4'd8: l_r <= 7'b0000000;
		4'd9: l_r <= 7'b0010000;
		4'd10: l_r <= 7'b0001000;
		4'd11: l_r <= 7'b0000011;
		4'd12: l_r <= 7'b1000110;
		4'd13: l_r <= 7'b0100001;
		4'd14: l_r <= 7'b0000110;
		default: l_r <= 7'b0001110;
	endcase
	case(pl_game)
		4'd0: l_g <= 7'b1000000;
		4'd1: l_g <= 7'b1111001;
		4'd2: l_g <= 7'b0100100;
		4'd3: l_g <= 7'b0110000;
		4'd4: l_g <= 7'b0011001;
		4'd5: l_g <= 7'b0010010;
		4'd6: l_g <= 7'b0000010;
		4'd7: l_g <= 7'b1111000;
		4'd8: l_g <= 7'b0000000;
		4'd9: l_g <= 7'b0010000;
		4'd10: l_g <= 7'b0001000;
		4'd11: l_g <= 7'b0000011;
		4'd12: l_g <= 7'b1000110;
		4'd13: l_g <= 7'b0100001;
		4'd14: l_g <= 7'b0000110;
		default: l_g <= 7'b0001110;
	endcase
	case(pr_round)
		4'd0: r_r <= 7'b1000000;
		4'd1: r_r <= 7'b1111001;
		4'd2: r_r <= 7'b0100100;
		4'd3: r_r <= 7'b0110000;
		4'd4: r_r <= 7'b0011001;
		4'd5: r_r <= 7'b0010010;
		4'd6: r_r <= 7'b0000010;
		4'd7: r_r <= 7'b1111000;
		4'd8: r_r <= 7'b0000000;
		4'd9: r_r <= 7'b0010000;
		4'd10: r_r <= 7'b0001000;
		4'd11: r_r <= 7'b0000011;
		4'd12: r_r <= 7'b1000110;
		4'd13: r_r <= 7'b0100001;
		4'd14: r_r <= 7'b0000110;
		default: r_r <= 7'b0001110;
	endcase
	case(pr_game)
		4'd0: r_g <= 7'b1000000;
		4'd1: r_g <= 7'b1111001;
		4'd2: r_g <= 7'b0100100;
		4'd3: r_g <= 7'b0110000;
		4'd4: r_g <= 7'b0011001;
		4'd5: r_g <= 7'b0010010;
		4'd6: r_g <= 7'b0000010;
		4'd7: r_g <= 7'b1111000;
		4'd8: r_g <= 7'b0000000;
		4'd9: r_g <= 7'b0010000;
		4'd10: r_g <= 7'b0001000;
		4'd11: r_g <= 7'b0000011;
		4'd12: r_g <= 7'b1000110;
		4'd13: r_g <= 7'b0100001;
		4'd14: r_g <= 7'b0000110;
		default: r_g <= 7'b0001110;
	endcase
end
endmodule

