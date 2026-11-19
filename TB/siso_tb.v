# code for siso_tb.v
  ...
     odule siso_tb();
        reg clk,rst,sin;
        wire sout;

        parameter CYCLE=10;


        siso DUT(clk,rst,sin,sout);

        always
        begin
                #(CYCLE/2);
                clk=1'b0;
                #(CYCLE/2);
      clk=1'b1;
        end

        task rst_dut;
                begin
                        @(negedge clk);
                        rst=1'b1;
                        @(negedge clk);
                        rst=1'b0;
                end
        endtask

        task initialize();
                begin
                        {clk,rst,sin}=0;
                end
        endtask

        task stimulus(input i);
                begin
                @(negedge clk)
                        sin=i;
                end
        endtask

        task delay;
                begin
        #10;
                end
        endtask

        initial
        begin
                initialize;
                rst_dut;
        stimulus(1);
        stimulus(0);
        stimulus(1);
        stimulus(1);

                        delay;

        end
        endmodule
    ...                    
