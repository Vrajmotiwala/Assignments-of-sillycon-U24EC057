module fun_demux(input I, input S1,input S2,input S3,input S4,output [15:0] O);
  function [15:0] demux;
    input E,D1,D2,D3,D4;
    begin
          demux[0]=~D1&~D2&~D3&~D4&E;
          demux[1]=~D1&~D2&~D3&D4&E;
          demux[2]=~D1&~D2&D3&~D4&E;
          demux[3]=~D1&~D2&D3&D4&E;
          demux[4]=~D1&D2&~D3&~D4&E;
          demux[5]=~D1&D2&~D3&D4&E;
          demux[6]=~D1&D2&D3&~D4&E;
          demux[7]=~D1&D2&D3&D4&E;
          demux[8]=D1&~D2&~D3&~D4&E;
          demux[9]=D1&~D2&~D3&D4&E;
          demux[10]=D1&~D2&D3&~D4&E;
          demux[11]=D1&~D2&D3&D4&E;
         demux[12]=D1&D2&~D3&~D4&E;
          demux[13]=D1&D2&~D3&D4&E;
         demux[14]=D1&D2&D3&~D4&E;
         demux[15]=D1&D2&D3&D4&E;
      end
  endfunction
  assign O=demux(I,S1,S2,S3,S4);
endmodule

    