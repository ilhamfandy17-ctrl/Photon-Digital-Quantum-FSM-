module testbench;

reg S1, S2, S3, S4, S5, S6;
wire A1, A2, A3, A4, A5, A6;
wire [2:0] state;

photon_fsm UUT (S1, S2, S3, S4, S5, S6, A1, A2, A3, A4, A5, A6, state);

initial begin
    $display("=== TEST SIMULASI PHOTON FSM ===");
    $display("S1 S2 S3 S4 S5 S6 | STATE | A1 A2 A3 A4 A5 A6");

    // Test case 1
    S1=0; S2=0; S3=0; S4=0; S5=0; S6=0; #1;
    $display("%b  %b  %b  %b  %b  %b  |  %b  |  %b  %b  %b  %b  %b  %b",
             S1,S2,S3,S4,S5,S6,state,A1,A2,A3,A4,A5,A6);

    // Test case 2
    S4=1; #1;
    $display("%b  %b  %b  %b  %b  %b  |  %b  |  %b  %b  %b  %b  %b  %b",
             S1,S2,S3,S4,S5,S6,state,A1,A2,A3,A4,A5,A6);

    // Test case 3
    S5=1; #1;
    $display("%b  %b  %b  %b  %b  %b  |  %b  |  %b  %b  %b  %b  %b  %b",
             S1,S2,S3,S4,S5,S6,state,A1,A2,A3,A4,A5,A6);

    // Test case 4
    S2=1; #1;
    $display("%b  %b  %b  %b  %b  %b  |  %b  |  %b  %b  %b  %b  %b  %b",
             S1,S2,S3,S4,S5,S6,state,A1,A2,A3,A4,A5,A6);

    // Test case 5
    S6=1; #1;
    $display("%b  %b  %b  %b  %b
