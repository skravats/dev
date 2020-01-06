set mmu_enabled 1
set ad_hdl_dir C:/Git/AnalogDevice
set ad_phdl_dir C:/Git/AnalogDevice
package require qsys
set_module_property NAME {system_bd}
set_project_property DEVICE_FAMILY {Arria 10}
set_project_property DEVICE 10AX115S2F45I1SG
source system_qsys.tcl
set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {AUTO}
set_interconnect_requirement {$system} {qsys_mm.burstAdapterImplementation} {PER_BURST_TYPE_CONVERTER}
set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {4}
save_system {system_bd.qsys}
