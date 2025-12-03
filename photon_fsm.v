module photon_fsm(
    input S1, S2, S3, S4, S5, S6,
    output A1, A2, A3, A4, A5, A6,
    output [2:0] state
);

reg q2 = 0, q1 = 0, q0 = 0;

// === STEP 7 LOGIC GATES ===
wire D2 = S2 | (S4 & S5) | (S4 & S6);
wire D1 = S1 | S3 | S5;
wire D0 = S4 | S5 | (S4 & S5);

// Update state (combinational version)
always @(*) begin
    q2 = D2;
    q1 = D1;
    q0 = D0;
end

assign state = {q2, q1, q0};

// === ACTUATOR LOGIC ===
assign A1 = q0;
assign A2 = q1;
assign A3 = (q2 & ~q1 & ~q0);
assign A4 = (q1 & q0) | (q2 & q0);
assign A5 = q0;
assign A6 = q0;

endmodule
