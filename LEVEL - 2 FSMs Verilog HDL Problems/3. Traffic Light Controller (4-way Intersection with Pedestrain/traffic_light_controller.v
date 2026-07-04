module traffic_light_controller(road_1,road_2,ped_walk,ped_req,clk,reset);

    output reg [1:0]road_1,road_2;
    output reg ped_walk;
    input ped_req,clk,reset;

    reg [2:0] state,prev_state,count;
    reg ped_req_latch;


    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
    parameter RED=2'b00, GREEN=2'b01, YELLOW=2'b10;

    always @(posedge clk) begin

        if(reset == 1) begin
            state <= S0;
            prev_state <= S0;
            count <= 3'b001;
            ped_req_latch <= 1'b0;
        end

        else begin

            if (ped_req == 1'b1) ped_req_latch <= 1'b1;

            case(state)
            
                S0: begin
                    road_1 <= GREEN;
                    road_2 <= RED;
                    ped_walk <= 1'b0;
                    count <= count + 1;
                    if (count == 5 ) begin
                        count <= 3'b001;
                        state <= S1;
                    end
                end

                S1: begin
                    road_1 <= YELLOW;
                    road_2 <= RED;
                    ped_walk <= 1'b0;
                    count <= count + 1;
                    if (count == 2) begin
                        count <= 3'b001;
                        prev_state <= state;
                        state <= (ped_req_latch == 1'b1) ? S4 : S2;
                    end
                end

                S2: begin
                    road_1 <= RED;
                    road_2 <= GREEN;
                    ped_walk <= 1'b0;
                    count <= count + 1;
                    if (count == 5) begin
                        count <= 3'b001;
                        state <= S3;
                    end
                end

                S3: begin
                    road_1 <= RED;
                    road_2 <= YELLOW;
                    ped_walk <= 1'b0;
                    count <= count + 1;
                    if (count == 2) begin
                        count <= 3'b001;
                        prev_state <= state;
                        state <= (ped_req_latch== 1'b1) ? S4 : S0;
                    end
                end

                S4 : begin
                    road_1 <= RED;
                    road_2 <= RED;
                    ped_walk <= 1'b1;
                    ped_req_latch <= 1'b0;
                    count <= count + 1;
                    if (count == 4) begin
                        count <= 3'b001;
                        if (prev_state == S1) state <= S2;
                        else state <= S0;
                    end
                end
            endcase
        end
    end
endmodule