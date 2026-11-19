# code for siso.v
  ...
     module siso(clk,rst,sin,sout);
        input clk,rst,sin;
        output reg sout;

        reg [3:0]shift_reg;

        always@(posedge clk)
        begin
                if(rst)
                begin
                        shift_reg<=0;
                        sout<=0;
                end
                else
                begin
                        shift_reg[0]<=sin;
                        shift_reg[1]<=shift_reg[0];
                        shift_reg[2]<=shift_reg[1];
                        shift_reg[3]<=shift_reg[2];
                        sout<=shift_reg[3];
                end
        end
        endmodule
...
