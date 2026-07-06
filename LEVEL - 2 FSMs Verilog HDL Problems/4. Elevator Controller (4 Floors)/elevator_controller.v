module elevator_controller(current_floor,moving_up,moving_down,door_open,floor_0_req,floor_1_req,floor_2_req,floor_3_req,clk,reset);

    output reg [1:0]current_floor;
    output reg moving_up,moving_down,door_open;

    input floor_0_req,floor_1_req,floor_2_req,floor_3_req;
    input clk,reset;

    reg [1:0]state,target_floor,floor;
    reg [3:0]count;
    reg floor_0_latch,floor_1_latch,floor_2_latch,floor_3_latch;

    parameter IDLE=2'b00,UP=2'b01,DOWN=2'b10,DOOR=2'b11;
    parameter GROUND=2'b00,FLOOR1=2'b01,FLOOR2=2'b10,FLOOR3=2'b11;

    always @ (posedge clk) begin

        if (reset) begin
            state <= IDLE;
            target_floor <= IDLE;
            count <= 4'b0000;
            floor <= GROUND;
        end

        else  begin

            if(floor_0_req) floor_0_latch <= 1'b1;
            if(floor_1_req) floor_1_latch <= 1'b1;
            if(floor_2_req) floor_2_latch <= 1'b1;
            if(floor_3_req) floor_3_latch <= 1'b1;

            case(state)

                IDLE : begin
                    
                    current_floor <= floor;
                    moving_up <= 0;
                    moving_down <= 0;
                    door_open <= 0;

                    if (target_floor > floor) state <= UP;
                    else if (target_floor < floor) state <= DOWN ;
                    else state <= state;
    
                end

                UP : begin
                    
                    current_floor <= floor;
                    moving_up <= 1;
                    count <= count + 1;
                    if (count == 2) begin
                        count <= 4'b0000;
                        floor <= floor + 1;
                        if(floor + 1 == target_floor) begin 
                            state <= DOOR;
                            moving_up <= 0;
                        end
                        else state <= UP;
                        count <= 4'b0000;
                    end
                end

                DOWN : begin
                    
                    current_floor <= floor;
                    moving_down <= 1;
                    count <= count + 1;
                    if (count == 2) begin
                        count <= 4'b0000;
                        floor <= floor - 1;
                        if(floor - 1 == target_floor) begin 
                            state <= DOOR;
                            moving_down <= 0;
                        end
                        else state <= DOWN;
                    end
                end

                DOOR : begin
                    
                    current_floor <= floor;
                    door_open <= 1;
                    count <= count + 1;
                    if (count == 4) begin
                        state <= IDLE;
                        door_open <= 0;
                        count <= 4'b0000;

                        case (floor) 
                        
                        GROUND : floor_0_latch <= 1'b0;  
                        FLOOR1 : floor_1_latch <= 1'b0;
                        FLOOR2 : floor_2_latch <= 1'b0;
                        FLOOR3 : floor_3_latch <= 1'b0;

                        endcase
                    end
                end
            endcase
        end 
    end

    always @ (*) begin

        if (state <= IDLE) begin 
        
                case (floor) 
                        
                GROUND : begin
                    if (floor_1_latch) target_floor = FLOOR1;
                    else if (floor_2_latch) target_floor = FLOOR2;
                    else if (floor_3_latch) target_floor = FLOOR3;
                    else target_floor = floor;
                end
                        
                FLOOR1 : begin
                    if (floor_0_latch) target_floor = GROUND;
                    else if (floor_2_latch) target_floor = FLOOR2;
                    else if (floor_3_latch) target_floor = FLOOR3;
                else target_floor = floor;
                end

                FLOOR2 : begin
                    if (floor_1_latch) target_floor = FLOOR1;
                    else if (floor_3_latch) target_floor = FLOOR3;
                    else if (floor_0_latch) target_floor = GROUND;
                    else target_floor = floor;
                end

                FLOOR3 : begin
                    if (floor_2_latch) target_floor = FLOOR2;
                    else if (floor_1_latch) target_floor = FLOOR1;
                    else if (floor_0_latch) target_floor = GROUND;
                    else target_floor = floor;
                end

                default : target_floor = target_floor;
            endcase
        end
    end
endmodule