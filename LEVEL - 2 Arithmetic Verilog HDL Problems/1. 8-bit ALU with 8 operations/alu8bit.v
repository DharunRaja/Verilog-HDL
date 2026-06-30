module alu8bitwith8operations(ALU_out,A,B,ALU_Sel,carry,zero);

    output reg [7:0] ALU_out;
    output reg carry;
    output wire zero;
    input [7:0] A,B;
    input [2:0] ALU_Sel;

    assign zero = (ALU_out == 8'b00000000);

    always @(*) begin

        case(ALU_Sel)

            3'b000: {carry,ALU_out} = A + B; 
            3'b001: {carry,ALU_out} = A - B; 
            3'b010: ALU_out = A & B;         
            3'b011: ALU_out = A | B;      
            3'b100: ALU_out = A ^ B;         
            3'b101: ALU_out = ~A;             
            3'b110: ALU_out = A << 1;        
            3'b111: ALU_out = A >> 1;        

            default: ALU_out = 8'b00000000;

        endcase

    end

endmodule