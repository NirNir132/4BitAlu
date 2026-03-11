`timescale 1ns/1ps

module testAlu;
    reg [7:0] A,B;
    reg [1:0] aluOp;
    wire [7:0] resTest;
    wire overFlowTest;

    alu testAlu(
        .A(A),
        .B(B),
        .aluOp(aluOp),
        .res(resTest),
        .overFlow(overFlowTest)
    );

    task check_result(input[7:0] res);
        begin
            $display("At time %t, the result is %d", $time, res);
        end
    endtask

    initial begin
        //print test text
        $display("Time\t BCD \t Seven-Segment Output");
        $display("------------------------------------");

        //test #1 : 7-10 = -3
        A = 8'd7;// a = 7
        B = 8'd10;// b = 10
        aluOp = 2'b01;
        #10;// waiting 10 nano-sec
        check_result(resTest);

        //test #2 : 25+12=27
        A = 8'd25;// a = 25
        B = 8'd12;// b = 12
        aluOp = 2'b11;
        #10;// waiting 10 nano-sec
        check_result(resTest);

        //test #3 : 101 OR 000 = 101
        A = 8'b101;// a = 101
        B = 8'd0;// b = 0
        aluOp = 2'b10;
        #10;// waiting 10 nano-sec
        check_result(resTest);

        //test #4 : 10010 XOR 01101= 11111
        A = 8'b10010;// a = 10010
        B = 8'b01101;// b = 01101
        aluOp = 2'b00;
        #10;// waiting 10 nano-sec
        check_result(resTest);
    end

    initial begin
    $dumpfile("waveform.vcd"); 
    $dumpvars(0, testAlu);
    end

endmodule
