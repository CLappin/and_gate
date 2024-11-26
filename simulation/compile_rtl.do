if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib ./presynth
}
vmap presynth presynth
#vmap PolarFire "C:/Microchip/Libero_SoC_v2024.1/Designer/lib/questasim/precompiled/vlog/polarfire"

vlog -sv -work presynth "./rtl/vlog/core/and_gate.v"
vlog -sv -work presynth "./rtl/vlog/test/and_gate_tb.v"

