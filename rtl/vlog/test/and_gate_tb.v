module tb_and_gate;
    // Testbench signals
    logic A;
    logic B;
    logic Y;

    // Instantiate the AND gate
    AND_GATE uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    // Task to apply stimulus and check results
    task apply_and_check(input logic a, input logic b, input logic expected_y);
        begin
            A = a;
            B = b;
            #1; // Wait for a time unit for the output to settle
            if (Y !== expected_y) begin
                $display("Test failed for A=%b, B=%b: Expected Y=%b, Got Y=%b", a, b, expected_y, Y);
            end else begin
                $display("Test passed for A=%b, B=%b: Y=%b", a, b, Y);
            end
        end
    endtask

    // Initial block to run the test
    initial begin
        // Apply test vectors
        apply_and_check(0, 0, 0);
        apply_and_check(0, 1, 0);
        apply_and_check(1, 0, 0);
        apply_and_check(1, 1, 1);

        // Finish simulation
        $finish;
    end
endmodule