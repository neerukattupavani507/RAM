`timescale 1ns/1ps

module ram_tb;

    reg        clk;
    reg        we;
    reg [3:0]  addr;
    reg [7:0]  din;

    wire [7:0] dout;

    // Instantiate RAM
    ram dut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initialize signals
        clk  = 0;
        we   = 0;
        addr = 0;
        din  = 0;

        // Generate waveform
        $dumpfile("ram.vcd");
        $dumpvars(0, ram_tb);

        // -------------------------
        // WRITE OPERATIONS
        // -------------------------

        write_data(4'h0, 8'hA1);
        write_data(4'h1, 8'hB2);
        write_data(4'h2, 8'hC3);
        write_data(4'h3, 8'hD4);

        // -------------------------
        // READ OPERATIONS
        // -------------------------

        read_data(4'h0);
        read_data(4'h1);
        read_data(4'h2);
        read_data(4'h3);

        #20;

        $finish;
    end

    // Write task
    task write_data(
        input [3:0] address,
        input [7:0] data
    );
    begin
        @(negedge clk);
        we   = 1;
        addr = address;
        din  = data;

        @(posedge clk);
        #1;

        $display("WRITE: Address = %h | Data = %h",
                 address, data);

        we = 0;
    end
    endtask

    // Read task
    task read_data(
        input [3:0] address
    );
    begin
        @(negedge clk);
        we   = 0;
        addr = address;

        @(posedge clk);
        #1;

        $display("READ : Address = %h | Data = %h",
                 address, dout);
    end
    endtask

endmodule