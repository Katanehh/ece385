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
