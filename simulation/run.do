vsim -voptargs="+acc" -L presynth -L PolarFire  -t 1ps presynth.tb_and_gate
add log -r /*
run -all
