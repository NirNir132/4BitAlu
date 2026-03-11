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
            $display("the result its %t",res);
        end
    endtask

    initial begin
        //print test text
        $display("Time\t BCD \t Seven-Segment Output");
        $display("------------------------------------");
        //test #1
        A = 8'd7;// a = 7
        B = 8'd10;// b = 10
        aluOp = 2'b01;
        #10;// waiting 10 nano-sec
        check_result(resTest);
        check_result(resTest);
    end

endmodule
