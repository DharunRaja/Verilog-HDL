module elevator_controller_tb();

    wire [1:0] current_floor;
    wire up,down,door;

    reg ground,first,second,third;
    reg clk,reset;

    elevator_controller uut(.current_floor(current_floor),.moving_up(up),.moving_down(down),.door_open(door),.floor_0_req(ground),.floor_1_req(first),.floor_2_req(second),.floor_3_req(third),.clk(clk),.reset(reset));

    initial clk = 0;
    always #5 clk = ~clk;

    always @(posedge clk) begin

        #2;
        $display("time = %0t , CURRENT FLOOR = %b , MOVING_UP = %b , MOVING_DOWN = %b ,DOOR = %b ,GROUND = %b ,FIRST = %b ,SECOND = %b ,THIRD = %b",$time,current_floor,up,down,door,ground,first,second,third);

    end

    initial begin 

        $dumpfile("elevator_controller(4_floor).vcd");
        $dumpvars(0,elevator_controller_tb);

        ground=0; first=0; second=0; third=0;reset=1;#20;
        reset=0;#20;

        second=1;#10;
        second=0;#150;

        ground=1; #10;
        ground=0;#150;

        first=1; third=1;#10;
        first=0; third=0;#450;

        $finish;

    end
endmodule
