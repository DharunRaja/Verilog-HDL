module alu8bitwith8operations_tb();

    reg [7:0] A,B;
    reg [2:0] ALU_Sel;
    wire [7:0] ALU_out;
    wire carry;
    wire zero;

    alu8bitwith8operations uut(ALU_out,A,B,ALU_Sel,carry,zero);

    always @ (A,B,ALU_Sel,ALU_out,zero) begin

        #1;
        $display("A = %b , B = %b , OPERATION = %b , OUTPUT = %b , CARRY = %b , ZERO = %b",A,B,ALU_Sel,ALU_out,carry,zero);

    end

    initial begin

        $dumpfile("alu8bitwith8operations.vcd");
        $dumpvars(0,alu8bitwith8operations_tb);
        
        A=8'b10101010; B=8'b01010101; ALU_Sel=3'b000; #10; // ADD
        A=8'b10101010; B=8'b01010101; ALU_Sel=3'b001; #10; // SUB
        A=8'b10101010; B=8'b01010101; ALU_Sel=3'b010; #10; // AND
        A=8'b10101010; B=8'b01010101; ALU_Sel=3'b011; #10; // OR
        A=8'b10101010; B=8'b01010101; ALU_Sel=3'b100; #10; // XOR
        A=8'b10101010; B=8'b01010101; ALU_Sel=3'b101; #10; // NOT
        A=8'b10101010; B=8'b01010101; ALU_Sel=3'b110; #10; // SHL
        A=8'b10101010; B=8'b01010101; ALU_Sel=3'b111; #10; // SHR
        A=8'b00000001; B=8'b00000010; ALU_Sel=3'b001; #10; 

        $finish;

    end

endmodule