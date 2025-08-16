module demo_slave(input clk,input rst,input T_valid,input [8:0] T_data,output reg [8:0] T_out,output reg T_ready);
always @(posedge clk) begin
  if (rst==0) begin
    T_out<=0;
    T_ready<=0;
  end else begin
    T_ready<=1;
    if (T_ready==1&&T_valid==1) begin
      T_out<=T_data;
    end
  end
end
endmodule
   

module demo_master(input clk,input rst,input [8:0] T_datain,input T_ready,output reg T_valid,output reg [8:0] T_data);
  always @(posedge clk) begin
    if (rst==0) begin
      T_data<=0;
      T_valid<=0;
    end else begin
      if(T_datain!=0) begin
        T_data<=T_datain;
        T_valid<=1;
      end else begin
        T_valid<=0;
      end
    end
  end
endmodule


module demo_top(input clk,input rst,input [8:0] T_datain,output [8:0] T_out);
  wire T_ready;
  wire T_valid;
  wire [8:0] T_data;
  
  demo_master umaster(
    .clk(clk),
    .rst(rst),
    .T_data(T_data),
    .T_datain(T_datain),
    .T_ready(T_ready),
    .T_valid(T_valid),
  );
  
  demo_slave uslave(
    .clk(clk),
    .rst(rst),
    .T_data(T_data),
    .T_ready(T_ready),
    .T_valid(T_valid),
    .T_out(T_out),
  );
endmodule