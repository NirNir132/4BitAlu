#here I used Gemini, from my understanding it's just an 'bridge' file to help the compiler with Veriltor to understand the .sv code.
MODULE = alu

all:
	verilator --binary --timing -Wall --Wno-fatal main.sv aluTestBench.sv fullAdder.sv aluModes.sv Mux.sv
	./obj_dir/Vtb_bcd_7seg
    # שלב 2: קימפול התוצר לתוכנה אחת
	make -C obj_dir -f V$(MODULE).mk V$(MODULE)

run: all
    # שלב 3: הרצה
	./obj_dir/V$(MODULE)

clean:
	rm -rf obj_dir
