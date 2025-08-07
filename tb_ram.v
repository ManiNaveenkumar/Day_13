module tb_ram;
reg clk,rst;
reg [7:0]write;
reg [7:0]read;
reg w,r;
reg [7:0]data;
wire [7:0]data_out;
 
ram uut(.clk(clk),.rst(rst),.write(write),.read(read),.w(w),.r(r),.data(data),.data_out(data_out));
initial begin
    clk=0;
    forever #10 clk=~clk;
    end
initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0, tb_ram);
    rst=1; w=0; r=0;data=8'd0;
        write=8'd0; read=8'd0;
        #20;
        rst=0;
    write=8'd5;
    data=8'hAB;
        w=1;
        #20;
        w=0;
        #20;
        read = 8'd5;
        r = 1;
        #20;
        r = 0;
        #20;
        w=1;
        write=8'd7;
        data=8'hCD;
        #20;
        w=0;
        r=1;
        read=8'd7;
        #20;
        r=0;
        #20;
    $finish;
end
    
endmodule