//module statemachine(	input logic Clk, Reset,
//		     	        input logic out_of_bounds,
//                        input logic [3:0] health,
//                        input logic [7:0] keycode,
//                        output logic main, playbackground, fail, success, spawn, 
//                        output logic [1:0] circletype
//                    );

//    enum logic [3:0] {  mainscreen, playscreen, beat1, beat2, beat3, beat4, buffer1, buffer2, buffer3, buffer4, 
//                        failscreen, passscreen, finished} current_state, next_state;

//    always_ff @ (posedge Clk)
//    begin
//        if (Reset) 
//            current_state <= mainscreen;
//        else 
//            current_state <= next_state;
//    end

//    always_comb
//    begin 
//        next_state = current_state;
//        main = 1'b0;
//        playbackground = 1'b0;
//        fail = 1'b0;
//        success = 1'b0;
//        spawn = 1'b0;
//        circletype = 2'b00;

//        unique case (current_state)
//            mainscreen:
//            begin
//                if (keycode == 8'd44) // player presses space to begin playing
//                begin
//                    next_state = playscreen;
//                end
                
//                else
//                begin
//                    next_state = current_state;
//                end
//            end
            
//            playscreen:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else
//                begin
//                    next_state = beat1;
//                end
//            end
            
//            beat1:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else
//                begin
//                next_state = buffer1;
//                end
//            end
            
//            buffer1:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else
//                begin
//			if (out_of_bounds == 1'd1) 
//			begin
//				next_state = beat2;
//			end

//			else
//			begin
//				next_state = current_state;
//			end
//                end
//            end
            
//            beat2:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else
//                begin
//                next_state = buffer2;
//                end
//            end
            
//            buffer2:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else
//                begin
//                next_state = beat3;
//                end
//            end
            
//            beat3:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else
//                begin
//                next_state = buffer3;
//                end
//            end
            
//            buffer3:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else
//                begin
//                next_state = beat4;
//                end
//            end
            
//            beat4:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else
//                begin
//                next_state = buffer4;
//                end
//            end
            
//            buffer4:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
////                else
////                begin
////			if (out_of_bounds == 4) // ensures all circles either pressed or missed
////			begin
////               			next_state = finished;
////			end

//			     else
//                 begin
//                    next_state = finished;
//                 end
//            end
            
//            finished:
//            begin
//               if (health >= 3'd2)
//               begin
//                    next_state = passscreen;
//               end
               
//               else
//               begin
//                    next_state = failscreen;
//               end
//            end
            
//            failscreen:
//            begin
//                if (keycode == 8'd44) // player presses space to go to main screen
//                begin
//                    next_state = mainscreen;
//                end
                
//                else
//                begin
//			    next_state = current_state;
//			    end
//            end
            
//			passscreen:
//			begin
//			    if(keycode == 8'd44) // player presses space to go to main screen
//			    begin
//			         next_state = mainscreen;
//			    end
			    
//			    else
//			    begin
//			         next_state = current_state;
//			    end
//			end
//        endcase

//        case (current_state)
//            mainscreen:
//            begin
//                main = 1'b1;
//                playbackground = 1'b0;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end

//            playscreen:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end
            
//            beat1:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b1;
//                circletype = 2'b00;
//            end
            
//            buffer1:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end
            
//            beat2:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b1;
//                circletype = 2'b01;
//            end
            
//            buffer2:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end
            
//            beat3:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b1;
//                circletype = 2'b10;
//            end
            
//            buffer3:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end
            
//            beat4:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b1;
//                circletype = 2'b11;
//            end
            
//            buffer4:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end
            
//            finished:
//            begin
//                main = 1'b0;
//                playbackground = 1'b1;
//                fail = 1'b0;
//                success = 1'b0;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end
            
//            failscreen:
//            begin
//                main = 1'b0;
//                playbackground = 1'b0;
//                fail = 1'b1;
//                success = 1'b0;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end
            
            
//            passscreen:
//            begin
//                main = 1'b0;
//                playbackground = 1'b0;
//                fail = 1'b0;
//                success = 1'b1;
//                spawn = 1'b0;
//                circletype = 2'b00;
//            end
 
//            default ;
//        endcase
//    end
//endmodule


//module statemachine(	input logic Clk, Reset,
//		     	        input logic out_of_bounds,
//                        input logic [3:0] health,
//                        input logic [7:0] keycode,
//                        input logic [2:0] counter,
//                        output logic main, playbackground, fail, success, spawn, 
//                        output logic [1:0] circletype
//                    );

//    enum logic [5:0] {  mainscreen, playscreen, beat1, beat2, beat3, beat4, buffer1, buffer2, buffer3, buffer4, 
//                        failscreen, passscreen, finished, zcircle, xcircle, ccircle, vcircle} current_state, next_state;

//    always_ff @ (posedge Clk)
//    begin
//        if (Reset) 
//            current_state <= mainscreen;
//        else 
//            current_state <= next_state;
//    end

//    always_comb
//    begin 
//        next_state = current_state;
//        main = 1'b0;
//        playbackground = 1'b0;
//        fail = 1'b0;
//        success = 1'b0;
//        spawn = 1'b0;
//        circletype = 2'b00;

//        unique case (current_state)
//            mainscreen:
//            begin
//                if (keycode == 8'd44) // player presses space to begin playing
//                begin
//                    next_state = playscreen;
//                end
                
//                else
//                begin
//                    next_state = current_state;
//                end
//            end
            
//            playscreen:
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
//                else if (keycode == 8'd29) // z
//                begin
//                    next_state = zcircle;
//                end
                
//                else if (keycode == 8'd27) // x
//                begin
//                    next_state = xcircle;
//                end
                
//                else if (keycode == 8'd6) // c
//                begin
//                    next_state = ccircle;
//                end
                
//                else if (keycode == 8'd25) // v
//                begin
//                    next_state = vcircle;
//                end
                
//                else if (counter > 5)
//                begin
//                    next_state = finished;
//                end
               
//                else
//                begin
//                    next_state = current_state;
//                end
//            end
            
//            zcircle: 
//            begin
//                if (keycode == 8'd20) // let player quit by pressing q
//                begin
//                    next_state = failscreen;
//                end
                
                
//            end
            
//            default: ;
//          endcase
//       end
//endmodule

module statemachine(	input logic Clk, Reset,
		     	input logic out_of_bounds,
                        input logic [3:0] health,
                        input logic [7:0] keycode,
                        output logic main, playbackground, fail, success, spawn, 
                        output logic [1:0] circletype
                    );
	logic [2:0] counter;
	enum logic [3:0] {  mainscreen, playscreen, smolblue, smolred, bigblue, bigred, buffer1, buffer2, buffer3, buffer4, 
                        failscreen, passscreen, finished, count} current_state, next_state;
	assign counter = 0;

    always_ff @ (posedge Clk)
    begin
        if (Reset) 
            current_state <= mainscreen;
        else 
            current_state <= next_state;
    end

    always_comb
    begin 
        next_state = current_state;
        main = 1'b0;
        playbackground = 1'b0;
        fail = 1'b0;
        success = 1'b0;
        spawn = 1'b0;
        circletype = 2'b00;

        unique case (current_state)
            mainscreen:
            begin
                if (keycode == 8'd44) // player presses space to begin playing
                begin
                    next_state = playscreen;
                end
                
                else
                begin
                    next_state = current_state;
                end
            end
            
            playscreen:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end

		// NEW LOGIC
		    else if (counter == 5) // FAKE COUNTER WE HAVEN'T MADE YET
			begin
				next_state = finished;
			end

		    
		else if (keycode == 8'h1D) // Z
		begin
			next_state = smolblue;
		end

		else if (keycode == 8'h1B) // X
		begin
			next_state = bigblue;
		end

		else if (keycode == 8'h06) // C
		begin
			next_state = smolred;
		end

		else if (keycode == 8'h19) // V
		begin
			next_state = bigred;
		end
					    
                else
                begin
                    next_state = current_state;
                end
            end
            
            smolblue:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end
                
                else
                begin
               		next_state = buffer1;
                end
            end
            
            buffer1:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end
                
                else
                begin
			if (out_of_bounds == 1'd1) 
			begin
				next_state = count;
			end

			else
			begin
				next_state = current_state;
			end
                end
            end
            
            bigblue:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end
                
                else
                begin
                next_state = buffer2;
                end
            end
            
            buffer2:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end
                
                else
                begin
               if (out_of_bounds == 1'd1) 
			begin
				next_state = count;
			end

			else
			begin
				next_state = current_state;
			end
                end
            end
            
            smolred:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end
                
                else
                begin
                next_state = buffer3;
                end
            end
            
            buffer3:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end
                
                else
                begin
               if (out_of_bounds == 1'd1) 
			begin
				next_state = count;
			end

			else
			begin
				next_state = current_state;
			end
                end
            end
            
            bigred:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end
                
                else
                begin
                next_state = buffer4;
                end
            end
            
            buffer4:
            begin
                if (keycode == 8'd20) // let player quit by pressing q
                begin
                    next_state = failscreen;
                end
                
		 else
                begin
               if (out_of_bounds == 1'd1) 
			begin
				next_state = count;
			end

			else
			begin
				next_state = current_state;
			end
                end
            end

	    count:
	    begin
		counter <= counter + 1;
		next_state = playscreen;
	    end
	    
            finished:
            begin
		    if (counter >= 3'd2)
               begin
                    next_state = passscreen;
               end
               
               else
               begin
                    next_state = failscreen;
               end
            end
            
            failscreen:
            begin
                if (keycode == 8'd44) // player presses space to go to main screen
                begin
                    next_state = mainscreen;
                end
                
                else
                begin
			    next_state = current_state;
			    end
            end
            
			passscreen:
			begin
			    if(keycode == 8'd44) // player presses space to go to main screen
			    begin
			         next_state = mainscreen;
			    end
			    
			    else
			    begin
			         next_state = current_state;
			    end
			end
        endcase

        case (current_state)
            mainscreen:
            begin
                main = 1'b1;
                playbackground = 1'b0;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b0;
                circletype = 2'b00;
            end

            playscreen:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b0;
                circletype = 2'b00;
            end
            
            smolblue:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b1;
                circletype = 2'b00;
            end
            
            buffer1:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b0;
                circletype = 2'b00;
            end
            
            bigblue:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b1;
                circletype = 2'b01;
            end
            
            buffer2:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b0;
                circletype = 2'b00;
            end
            
            smolred:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b1;
                circletype = 2'b10;
            end
            
            buffer3:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b0;
                circletype = 2'b00;
            end
            
            bigred:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b1;
                circletype = 2'b11;
            end
            
            buffer4:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b0;
                circletype = 2'b00;
            end
            
            finished:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
                spawn = 1'b0;
                circletype = 2'b00;
            end
            
            failscreen:
            begin
                main = 1'b0;
                playbackground = 1'b0;
                fail = 1'b1;
                success = 1'b0;
                spawn = 1'b0;
                circletype = 2'b00;
            end
            
            
            passscreen:
            begin
                main = 1'b0;
                playbackground = 1'b0;
                fail = 1'b0;
                success = 1'b1;
                spawn = 1'b0;
                circletype = 2'b00;
            end
 
            default ;
        endcase
    end
endmodule
