module priencoder(input I1,input I2,input I3,input I4,output reg S1,S2,VAL);
  always@(*)
    begin
      S1=0;
      S2=0;
      VAL=0;
      if(I4==1) begin
         S1=1;
         S2=1;
         VAL=1;
      end
     else if(I3==1) begin
        S1=0;
        S2=1;
        VAL=1;
      end
      else if(I2==1)begin
        S1=1;
        S2=0;
        VAL=1;
      end
      else if(I1==1) begin
        S1=0;
        S2=0;
        VAL=1;
      end
    end
endmodule

        
            
        
      
  
      
        
      
    
     
 