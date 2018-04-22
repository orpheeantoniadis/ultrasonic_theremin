
module nios (
	clk_clk,
	i2s0_export_mck,
	i2s0_export_lrck,
	i2s0_export_data,
	i2s0_export_sck,
	led_sel_b_export_readdata,
	led_sel_g_export_readdata,
	led_sel_r_export_readdata,
	led_selc_n_export_readdata,
	ledsa_export_export,
	ledsb_export_export,
	reset_reset_n,
	ultrasound_export_0_echo,
	ultrasound_export_0_trig,
	ultrasound_export_1_echo,
	ultrasound_export_1_trig,
	ultrasound_export_2_echo,
	ultrasound_export_2_trig,
	ultrasound_export_3_echo,
	ultrasound_export_3_trig);	

	input		clk_clk;
	output		i2s0_export_mck;
	output		i2s0_export_lrck;
	output		i2s0_export_data;
	output		i2s0_export_sck;
	output	[7:0]	led_sel_b_export_readdata;
	output	[7:0]	led_sel_g_export_readdata;
	output	[7:0]	led_sel_r_export_readdata;
	output	[11:0]	led_selc_n_export_readdata;
	output	[7:0]	ledsa_export_export;
	output	[7:0]	ledsb_export_export;
	input		reset_reset_n;
	input		ultrasound_export_0_echo;
	output		ultrasound_export_0_trig;
	input		ultrasound_export_1_echo;
	output		ultrasound_export_1_trig;
	input		ultrasound_export_2_echo;
	output		ultrasound_export_2_trig;
	input		ultrasound_export_3_echo;
	output		ultrasound_export_3_trig;
endmodule
