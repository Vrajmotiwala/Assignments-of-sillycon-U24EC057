module mux_fun(input [15:0] I,input S1,input S2,input S3,input S4,output O );
  reg T;
  task multiplex;
    input [15:0] D;
    input E1,E2,E3,E4;
    output R;
    begin
      R = (~E1&~E2&~E3&~E4&D[0])|(~E1&~E2&~E3&E4&D[1])|(~E1&~E2&E3&~E4&D[2])|(~E1&~E2&E3&E4&D[3])|(~E1&E2&~E3&~E4&D[4])|(~E1&E2&~E3&E4&D[5])|(~E1&E2&E3&~E4&D[6])|(~E1&E2&E3&E4&D[7])|(E1&~E2&~E3&~E4&D[8])|(E1&~E2&~E3&E4&D[9])|(E1&~E2&E3&~E4&D[10])|(E1&~E2&E3&E4&D[11])|(E1&E2&~E3&~E4&D[12])|(E1&E2&~E3&E4&D[13])|(E1&E2&E3&~E4&D[14])|(E1&E2&E3&E4&D[15]);
    end
  endtask
  always @(*)begin
    multiplex(I,S1,S2,S3,S4,T);
  end
  assign O=T;
endmodule