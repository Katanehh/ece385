// This module defines the logic of the left-moving circle which is the incoming circles to hit (depending on the input from another module which determines when to spawn the circles based on the map)
// The input will be 'spawn' which is the time at which the circles will spawn depending on the map (different module) and 'type' which determines the characteristic of the circle
// The output will be the location of the incoming circle (X-Coordinates), the size of the circle (small/big), and the color (blue/red) (0/1)

module  Incoming_Circle ( input logic Reset, frame_clk,
		                  input logic spawn, 
		                  input logic playbackground,
		                  input logic [1:0] circletype,
                          output logic [9:0]  BallX, BallY, BallS, 
                          output logic color );
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    parameter [9:0] Target_X = 100; // Fixed Position of the Target Circle
    parameter [9:0] Target_Y = 240;
    
    logic balls;
    assign balls = Ball_X_Max;
    
    always_comb
    begin
    	if (circletype == 2'd0 || circletype == 2'd2)
            begin
                BallS = 12;  // small size
            if (circletype == 2'd0)
            begin
                color = 1'd0; // blue
            end
            else // (circletype == 2)
            begin
                color = 1'd1; // red
            end
     	end

   	 else // (circletype == 1 || circletype == 3)
         begin
             BallS = 16; // big size
             if (circletype == 2'd1)
             begin
                color = 1'd0; // blue
             end
             else // (circletype == 3)
             begin
                color = 1'd1; // red
             end
         end
    end

//    always_ff @ (posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
//    begin: Move_ball
//        if (Reset)  // asynchronous Reset - kinda useless
//        begin 
//		BallY <= Ball_Y_Center;
//		BallX <= Ball_X_Max; // Ball will be at the rightmost edge
//        end
           
//        else 
//        begin
//            if (playbackground == 1'd1 && spawn == 1'd1)
//            begin         
//                    BallY <= Ball_Y_Center;
//                    balls <= balls - 1'd1;	
//                    BallX <= balls;
//            end	 
//        end
//    end

    always_ff @ (posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
    begin: Move_ball
        if (Reset)  // asynchronous Reset - kinda useless
        begin 
		BallY <= Ball_Y_Center;
		BallX <= Ball_X_Max; // Ball will be at the rightmost edge
        end
           
        else 
        begin 
	        if (spawn == 1)
            begin
                BallY <= Ball_Y_Center;
	           BallX <= Ball_X_Max;
            end
            
            else
            begin
                BallY <= Ball_Y_Center;
	            BallX <= BallX - 1;
            end			 
        end
     end
      
endmodule
