#here I used Gemini, from my understanding it's just an 'bridge' file to help the compiler with Veriltor to understand the .sv code.
MODULE = alu
TB = testAlu
SOURCES = main.sv aluTestBench.sv fullAdder.sv aluModes.sv Mux.sv

all: run view

compile:
	verilator --binary --timing --trace -Wall --Wno-fatal $(SOURCES) --top-module $(TB)

run: compile
	./obj_dir/V$(TB)

view:
	gtkwave waveform.vcd &

clean:
	rm -rf obj_dir waveform.vcd