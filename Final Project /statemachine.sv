module statemachine(	input logic Clk, Reset, playerfailed, playerpass,
                        input logic [7:0] keycode,
                        output logic main, playbackground, fail, success
                    );

    enum logic [1:0] {  mainscreen, playscreen, failscreen1, failscreen2, failscreen3, failscreen4, passscreen} current_state, next_state;

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
                    next_state = failscreen1;
                end
                
                else if (playerfailed)
                begin
                    next_state = failscreen1;
                end
                
                else if (playerpass)
                begin
                    next_state = passscreen;
                end
                
                else
                begin
                    next_state = current_state;
                end
            end
            
            failscreen1:
			    next_state = failscreen2;
			
			failscreen2:
			    next_state = failscreen3;
			
			failscreen3:
			    next_state = failscreen4;
			
			failscreen4:
			    next_state = mainscreen;
			
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
            end

            playscreen:
            begin
                main = 1'b0;
                playbackground = 1'b1;
                fail = 1'b0;
                success = 1'b0;
            end
            
            failscreen1:
            begin
                main = 1'b0;
                playbackground = 1'b0;
                fail = 1'b1;
                success = 1'b0;
            end
            
            failscreen2:
            begin
                main = 1'b0;
                playbackground = 1'b0;
                fail = 1'b1;
                success = 1'b0;
            end
            
            failscreen3:
            begin
                main = 1'b0;
                playbackground = 1'b0;
                fail = 1'b1;
                success = 1'b0;
            end
            
            failscreen4:
            begin
                main = 1'b0;
                playbackground = 1'b0;
                fail = 1'b1;
                success = 1'b0;
            end
            
            passscreen:
            begin
                main = 1'b0;
                playbackground = 1'b0;
                fail = 1'b0;
                success = 1'b1;
            end
 
            default ;
        endcase
    end
endmodule
