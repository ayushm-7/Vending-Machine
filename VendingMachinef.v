module VendingMachinef(
 input clk,                 
 input rst,                 

 input [1:0] in,            // Coin input

 output reg [1:0] out,      //Decides what to dispense normal item or special item
                            // 00 = no item
                            // 01 = normal item (e.g., water bottle)
                            // 10 = special item

 output reg [1:0] change,   // For returning money back
                            // 00 = no change
                            // 01 = return ₹5
                            // 10 = return ₹10
                            // 11 = return invalid coin

 output reg [2:0] state_led // Status indication:
                            // 001 = idle
                            // 010 = processing
                            // 100 = error
);

parameter s0 = 2'b00;       // ₹0 inserted (Idle)
parameter s1 = 2'b01;       // ₹5 inserted
parameter s2 = 2'b10;       // ₹10 inserted

reg [1:0] c_state;          // Current state 

always @(posedge clk)
begin
    if(rst)
    begin
        c_state   <= s0;
        out       <= 2'b00;  // No item
        change    <= 2'b00;  // No change
        state_led <= 3'b001; // Idle
    end
    else
    begin
        case(c_state)

        s0: //state 0 : 0 rs
        begin
            if(in == 2'b00) // No coin
            begin
                c_state <= s0;
                out <= 2'b00;
                change <= 2'b00;
                state_led <= 3'b001; // Idle
            end

            else if(in == 2'b01) // ₹5 inserted
            begin
                c_state <= s1;
                out <= 2'b00;
                change <= 2'b00;
                state_led <= 3'b010; // Processing
            end

            else if(in == 2'b10) // ₹10 inserted
            begin
                c_state <= s2;
                out <= 2'b00;
                change <= 2'b00;
                state_led <= 3'b010; // Processing
            end

            else if(in == 2'b11) // Invalid coin
            begin
                c_state <= s0;
                out <= 2'b00;
                change <= 2'b11; // Return invalid coin
                state_led <= 3'b100; // Error
            end
        end
         
        s1:  //state 1 : 5 rs
        begin
            if(in == 2'b00) // Cancel
            begin
                c_state <= s0;
                out <= 2'b00;
                change <= 2'b01; // Return ₹5
                state_led <= 3'b001; // Idle
            end

            else if(in == 2'b01) // ₹5 + ₹5 = ₹10
            begin
                c_state <= s2;
                out <= 2'b00;
                change <= 2'b00;
                state_led <= 3'b010; // Processing
            end

            else if(in == 2'b10) // ₹5 + ₹10 = ₹15
            begin
                c_state <= s0;
                out <= 2'b10;   // Dispense special item
                change <= 2'b00;
                state_led <= 3'b001; // Idle
            end

            else if(in == 2'b11) // Invalid coin
            begin
                c_state <= s1;
                out <= 2'b00;
                change <= 2'b11;
                state_led <= 3'b100; // Error
            end
        end

        s2: //state 2 : 10 rs
        begin
            if(in == 2'b00) // Cancel
            begin
                c_state <= s0;
                out <= 2'b00;
                change <= 2'b10; // Return ₹10
                state_led <= 3'b001; // Idle
            end

            else if(in == 2'b01) // ₹10 + ₹5 = ₹15
            begin
                c_state <= s0;
                out <= 2'b01;   // Dispense normal item
                change <= 2'b00;
                state_led <= 3'b001; // Idle
            end

            else if(in == 2'b10) // ₹10 + ₹10 = ₹20
            begin
                c_state <= s0;
                out <= 2'b01;   // Dispense item
                change <= 2'b01; // Return ₹5
                state_led <= 3'b001; // Idle
            end

            else if(in == 2'b11) // Invalid coin
            begin
                c_state <= s2;
                out <= 2'b00;
                change <= 2'b11;
                state_led <= 3'b100; // Error
            end
        end

        endcase
    end
end

endmodule
