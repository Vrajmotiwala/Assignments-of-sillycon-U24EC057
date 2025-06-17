// Code your design here
module comparator(input [3:0] a ,
                  input [3:0] b , 
                  output reg s1,
                  output reg s2,
                  output reg s3
                 );
  always @(*) begin
    s1=0;
    s2=0;
    s3=0;
    if(a==b) begin
      s1=1;
    end
    else if(a>b) begin
      s2=1;
    end
    else begin
      s3=1;
    end
  end
endmodule