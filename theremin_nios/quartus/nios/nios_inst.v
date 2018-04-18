	nios u0 (
		.clk_clk                    (<connected-to-clk_clk>),                    //               clk.clk
		.led_sel_b_export_readdata  (<connected-to-led_sel_b_export_readdata>),  //  led_sel_b_export.readdata
		.led_sel_g_export_readdata  (<connected-to-led_sel_g_export_readdata>),  //  led_sel_g_export.readdata
		.led_sel_r_export_readdata  (<connected-to-led_sel_r_export_readdata>),  //  led_sel_r_export.readdata
		.led_selc_n_export_readdata (<connected-to-led_selc_n_export_readdata>), // led_selc_n_export.readdata
		.ledsa_export_export        (<connected-to-ledsa_export_export>),        //      ledsa_export.export
		.ledsb_export_export        (<connected-to-ledsb_export_export>),        //      ledsb_export.export
		.reset_reset_n              (<connected-to-reset_reset_n>),              //             reset.reset_n
		.ultrasound_export_echo     (<connected-to-ultrasound_export_echo>),     // ultrasound_export.echo
		.ultrasound_export_trig     (<connected-to-ultrasound_export_trig>),     //                  .trig
		.i2s0_export_mck            (<connected-to-i2s0_export_mck>),            //       i2s0_export.mck
		.i2s0_export_lrck           (<connected-to-i2s0_export_lrck>),           //                  .lrck
		.i2s0_export_data           (<connected-to-i2s0_export_data>),           //                  .data
		.i2s0_export_sck            (<connected-to-i2s0_export_sck>)             //                  .sck
	);

