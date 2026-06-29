module dflipflop(Q,D,reset,clk,enable);

    output reg Q;
    input D,reset,clk,enable;

    always @ (posedge clk)

        begin
            
            if (reset==1) Q = 1'b0;

            else if (enable==1) Q = D;

            else Q = Q;
            
        end

endmodule