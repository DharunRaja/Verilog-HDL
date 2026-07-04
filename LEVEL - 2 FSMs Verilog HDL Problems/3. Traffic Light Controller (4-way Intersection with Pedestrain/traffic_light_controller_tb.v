module traffic_light_controller_tb();

    wire [1:0] road_1,road_2;
    wire ped_walk;

    reg ped_req,clk,reset;

    initial clk = 1'b0;

    traffic_light_controller dut(road_1,road_2,ped_walk,ped_req,clk,reset);

    always #5 clk = ~clk;

    always @(posedge clk) begin
        
        #2;
        $display("Time = %0t , RESET = %b , ROAD_1 = %b , ROAD_2 = %b , PED_WALK = %b , PED_REQ = %b ",$time,reset,road_1,road_2,ped_walk,ped_req);
    end

    initial begin

        $dumpfile("traffic_light_controller.vcd");
        $dumpvars(0,traffic_light_controller_tb);

        ped_req=1'b0;reset=1'b1;#10;
        reset=1'b0;#100;

        ped_req=1'b1;#20;
        ped_req=1'b0;#20;

        ped_req=1'b1;#50;
        ped_req=1'b0;#80;

        $finish;
    end
endmodule