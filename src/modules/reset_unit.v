module reset_unit(
	input clk,
	output reg reset
);

reg [19:0] delay_counter;

always @(posedge clk) begin
	if(delay_counter <= 1 << 19) begin
		reset <= 1;
		delay_counter <= delay_counter + 1'b1;
	end
	else begin
		reset <= 0;
	end
end

endmodule
