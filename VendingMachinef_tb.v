module VendingMachinef_tb;

reg clk;
reg[1:0] in;
reg rst;
//output
wire[1:0] out;
wire[1:0] change;
wire[2:0] state_led;
VendingMachinef uut(
.clk(clk),
.rst(rst),
.in(in),
.out(out),
.change(change),
.state_led(state_led)
);
initial clk = 0;           
always #5 clk = ~clk;     

initial begin

    rst = 1;
    in = 2'b00;

    #20;
    rst = 0;

    // Insert ₹5
    #10;
    in = 2'b01;

    // Insert ₹10 → should dispense item
    #10;
    in = 2'b10;

    // Insert invalid coin
    #10;
    in = 2'b11;

    // Insert ₹5
    #10;
    in = 2'b01;

    // Insert ₹10 → special item
    #10;
    in = 2'b10;

    // Insert ₹10
    #10;
    in = 2'b10;

    // Insert ₹10 → item + change
    #10;
    in = 2'b10;

    // Reset again
    #10;
    rst = 1;

    #10;
    rst = 0;

    #50;
    $finish;
 end

endmodule
