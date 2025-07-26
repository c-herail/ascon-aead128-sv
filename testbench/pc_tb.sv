`timescale 1ns/1ps

import ascon_aead128_pkg::ascon_state;
import ascon_aead128_pkg::round;
import ascon_aead128_pkg::const_add;

module pc_tb();

    // testbench variables
    bit         test_pass = 1;

    // DUT variables
    round       rnd;
    ascon_state current_state;
    ascon_state next_state;

    pc DUT (
        .*
    );

    initial begin
        // init
        current_state = '0;

        // test pc() operation
        for (int i = 0; i < 16; i++) begin
            rnd = i[3:0];
            #0;
            // check S2
            if (next_state.s2 != {56'b0, const_add[rnd]}) begin
                test_pass = 0;
                $display("Error, expected : 0x%016h, actual: 0x%016h",
                                      {56'b0, const_add[rnd]}, next_state.s2);
            end
            // pc() operation should not change S0, S1, S3 and S4
            assert(current_state.s0 == next_state.s0) else test_pass = 0;
            assert(current_state.s1 == next_state.s1) else test_pass = 0;
            assert(current_state.s3 == next_state.s3) else test_pass = 0;
            assert(current_state.s4 == next_state.s4) else test_pass = 0;
            #20;
            current_state.s2 = 64'h0;
        end

        // return if test suceed or failed
        if(test_pass == 1)
            $display("Test sucess (pc)");
        else
            $display("Test failed (pc)");

        // stop simulation if run without GUI
        if ($test$plusargs("console_mode")) begin
            $finish;
        end
    end

endmodule : pc_tb