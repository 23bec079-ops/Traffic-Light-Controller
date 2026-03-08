module tb_traffic_light ();
    reg Clk, rst;
    wire [1:0] NS, EW;
    initial Clk = 0;
    always #10 Clk =~Clk;
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);
        rst = 0;
        #50 rst = 1;
        #100 rst = 0;
    end
    initial #250000 $finish;
    traffic_light_controller uut(.clk(Clk), .rst(rst), .NS(NS), .EW(EW)); 
    initial $monitor("Time=%0t NS=%b EW=%b", $time, NS, EW);
    always @(posedge Clk)
        $display("Time=%0t NS=%b EW=%b", $time, NS, EW);
endmodule
