module Dmem32x32 (
    input          clk,
    input          we,          // write enable
    input  [4:0]   addr,        // 0..31
    input  [31:0]  wdata,
    output reg [31:0] rdata
);

    // 32 words, each 32-bit
    reg [31:0] mem [0:31];

    // synchronous read + write
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= wdata;    // write
        end
        rdata <= mem[addr];        // read
    end

endmodule
