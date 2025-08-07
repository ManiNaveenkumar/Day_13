module ram (
    input clk,rst,
    input [7:0]write,
    input [7:0]read,
    input w,r,
    input [7:0]data,
    output reg [7:0]data_out
);
    parameter width=8;
    parameter depth=256;
    integer i;
    reg [width-1:0] memory[depth-1:0];
  
    always @(posedge clk) begin
        if(rst)
        begin
            for(i=0;i<256;i=i+1)
            memory[i]<=0;
            data_out<=0;
        end
        if(w)
        begin
            memory[write]<=data;
        end
        if(r)
        begin
            data_out<=memory[read];
        end
    end
endmodule