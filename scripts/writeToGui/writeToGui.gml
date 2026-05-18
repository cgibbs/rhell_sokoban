function writeToGui(text_x, text_y, text, color, isWithBackground=false, hAlign=fa_center){
	var guiw = display_get_gui_width();
	var guih = display_get_gui_height();

	draw_set_colour(c_black);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_alpha(.8);
	if (isWithBackground) draw_rectangle(0, 0, guiw, guih, false)
	draw_set_alpha(1);

	draw_set_colour(color)
	draw_text(text_x, text_y, text);
}