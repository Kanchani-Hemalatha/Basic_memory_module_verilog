//================================================================================================
//					TESTBENCH																	  
//================================================================================================
// Module Name      : tb
// Signal Description : 
//						clk  -> 100MHZ
//						reset  -> active high
//						data_in -> 8bits
//						data_out -> 8bits
//						wr_en -> 1bit
//						rd_en -> 1bit
//						mem -> is used to store the expected data
//						count -> error count
// Write Operations : Writes 10 random values to memory
// Read Operations  : Reads back 10 values from memory
// Verification     : Compares data_out with expected values (mem[j])
// Test Pass Criteria : count == 0 (All values match)
// Test Fail Criteria : count > 0 (Mismatch detected)
//================================================================================================

`timescale 1ns/1ns
module tb;
  
  reg clk=0;
  reg wr_en=0;
  reg rd_en=0;
  reg reset;
  reg [3:0]addr=0;
  reg [7:0] data_in=0;
  wire[7:0] data_out;
  integer i=0,j=0;
  reg[7:0] mem[15:0];
  integer count=0;
  
  memory dut(clk,wr_en,reset,rd_en,addr,data_in,data_out); //memory instance
  
  always #5 clk = ~clk; //clk generation
  
  //task to enable read conditions
  task write_data;
    wr_en = 1;
    addr = i;
    data_in = $random;
    mem[i] = data_in;
    @(posedge clk);
     i++;
  endtask
  
  //task to enable read conditions
  task read_data;
     rd_en = 1;
     addr = j;
    @(posedge clk);
    if(data_out) begin
      if (data_out !== mem[j]) count++;
    end
    j++;
  endtask
 
  initial begin
    //reset
    reset = 1;
    #10;
    reset = 0;
    #5;
    repeat(10) begin
      write_data(); //calling write_data task
    end
    
    wr_en = 0;
    
    repeat(10) begin
      read_data(); //calling read_data task
    end
    
    rd_en = 0;
    
  end
//Printing TEST Pass and Failure 
    final begin
      if(count==0)begin
         $display("===========================");
         $display ("\tTEST PASS");
         $display("===========================");
      end else begin
         $display("===========================");
         $display("\tTEST FAIL");
         $display("===========================");
      end
    end
  //waveform dumping 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    //$dumpvars(0,dut.mem[0]);
    //$dumpvars(0,tb.mem[0]);
  end
 initial begin
    #250 $finish; //calling $finish to terminate the simmulation
  end
   
endmodule:tb
