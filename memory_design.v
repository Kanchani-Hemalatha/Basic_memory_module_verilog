//================================================================================================
//                                  BASIC MEMORY MODULE DEFINITION								  
//================================================================================================
module memory(
  input  clk,
  input  wr_en, //write enable 
  input  reset, //active high synchronous reset
  input  rd_en, //read enable
  input  [3:0]addr,//address 
  input  [7:0]data_in, //input data
  output reg [7:0]data_out); //output data
  reg[7:0]mem[15:0];
  always@(posedge clk)begin
    if(reset) begin 
      data_out <= 0; 
      for(int i=0; i<=15;i++) begin
        mem[i] <= 0; 
      end
    end else begin
    	if(wr_en)
          mem[addr]<=data_in; //write operation
      
        if(rd_en)
          data_out<=mem[addr]; //read operation
  	end
  end  
endmodule:memory

