module my_dual_port_memory(
    input wire clk,
    input wire [3:0] addr,
    input wire [15:0] data_in,
    input wire write_enable,
    output reg [15:0] data_out
);

    reg [15:0] mem [0:15];
    always @(posedge clk) begin   
        if (write_enable) begin
            mem[addr] <= data_in;
        end
    end
    always @(negedge clk) begin
        data_out <= mem[addr];
    end
endmodule
