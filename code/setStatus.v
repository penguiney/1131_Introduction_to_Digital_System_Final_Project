module setStatus(
	input clk,
	input left_stop_spinning, 
	input right_stop_spinning, 
	input reset, 
	input change_status,
	input [1:0] left_score,
	input [1:0] right_score,
	output reg [1:0] status,
	output reg reset_stopbutton,
	output reg game_end
);

	reg [4:0] status_flag;
	
	always @(posedge clk or negedge reset) begin
		if (~reset) begin
			status <= 2'd0;
			status_flag <= 5'b0;
			game_end <= 1'd0;
		end else begin
			if(change_status == 1'b1) begin 
				status <= 2'd3;
				status_flag <= 5'd1;
				game_end <= 1'd1;
			end	
		
			if (status_flag > 5'd0) begin
				if(status_flag == 5'd6) begin
					status <= 2'd1;
					status_flag <= 5'd0;
					reset_stopbutton <= 1'b1;
				end else begin
					status_flag <= status_flag + 1;
				end
			end else begin
				game_end <= 1'b0;
				if (right_stop_spinning == 1'd1 && left_stop_spinning == 1'd1) begin
					if (status == 2'd1) begin
						status <= 2'd2;
						status_flag <= 5'd1;						
					end else begin
						status <= status;
					end				
				end else begin
					status <= 2'd1;
				end
			end

			if (status == 2'd1 || status == 2'd0) reset_stopbutton <= 1'b0;
		end
	end
endmodule

module clk_for_status( // 3s clk
	input clk,
	input reset,
	output reg clk_div
);
	reg [31:0] count;
	
	always@(posedge clk or negedge reset) begin
		if(~reset) begin
			count <= 31'd0;
			clk_div <= 1'b0;
		end else begin
			if(count == 31'd14999999) begin
				count <= 31'd0;
				clk_div <= ~clk_div;
			end else begin
				count <= count + 31'd1;
			end
		end
	end
endmodule

