config system_bd_altera_msgdma_181_zsqwlma_cfg;
		design system_bd_altera_msgdma_181_zsqwlma;
		instance system_bd_altera_msgdma_181_zsqwlma.dispatcher_internal use system_bd_modular_sgdma_dispatcher_181.dispatcher;
		instance system_bd_altera_msgdma_181_zsqwlma.write_mstr_internal use system_bd_dma_write_master_181.write_master;
endconfig

