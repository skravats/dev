set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_jtag_uart_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9680_core.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9144_fifo.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_reset_in.ip
set_global_assignment -name IP_FILE ip/interlaken_phy/interlaken_phy_clock_bridge_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9680_jesd204.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/iopll_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9144_upack.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_nios_custom_instr_floating_point_2_0.ip
set_global_assignment -name IP_FILE ip/interlaken_phy/interlaken_phy_xcvr_native_a10_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9680_dma.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_clock_in.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_generic_quad_spi_controller2_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/timer_1.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/timer_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/i2c.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9680_cpack.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/spi.ip
set_global_assignment -name IP_FILE ip/interlaken_phy/interlaken_phy_xcvr_atx_pll_a10_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ddr3.ip
set_global_assignment -name IP_FILE ip/interlaken_phy/interlaken_phy_xcvr_data_flow_controller_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_cpu_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9144_core.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_mm_clock_crossing_bridge_0.ip
set_global_assignment -name IP_FILE ip/interlaken_phy/interlaken_phy_xcvr_reset_control_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9680_fifo.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_mm_clock_crossing_bridge_3.ip
set_global_assignment -name IP_FILE ip/interlaken_phy/interlaken_phy_reset_bridge_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_mm_clock_crossing_bridge_1.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9144_jesd204.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_mm_clock_crossing_bridge_2.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_ram_0.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/ad9144_dma.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/mcu_subsystem_clock_bridge_1.ip
set_global_assignment -name IP_FILE ip/mcu_subsystem/gpio.ip

# Merge RX and TX into single transceiver
for {set i 0} {$i < 4} {incr i} {
  set_instance_assignment -name XCVR_RECONFIG_GROUP xcvr_${i} -to rx_serial_data[${i}]
  set_instance_assignment -name XCVR_RECONFIG_GROUP xcvr_${i} -to tx_serial_data[${i}]
}
