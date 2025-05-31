var gh = display_get_gui_height()
var gw = display_get_gui_width()

//draw_text_transformed(0, 0, "cur_button:  " + string(cur_button), 3, 3, 0)

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_iflash);
draw_set_color(#BCAE72);

draw_sprite_ext(spr_houte_bootje, 0, gw/4, heights[cur_button], 2, 2, 270, c_white, 1)

draw_text_transformed(gw/2, 100, "Row & Reel", 10, 10, 0);

draw_text_transformed(gw/2, heights[0], "PLAY", 8, 8, 0);
draw_text_transformed(gw/2+5, heights[1], "CONTROLS", 8, 8, 0);
draw_text_transformed(gw/2, heights[2], "QUIT", 8, 8, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (controls){

draw_set_color(#7F6132);

	var text = ["- Move: WASD", "- Toggle anchor: F", "- Go fishing: E", "- Fish: Lmb, Space", "- Toggle shop in", "   green area: F", "- Switch boats: Q", "- Switch rods: R"]

	var offset = 20;
	var tscale = 4;
	var tsep = 45;

	var xb = gw/3*2+offset;
	var yb = 320;
	var wb = gw/3-2*offset;
	var hb = gh-yb - offset;

	var xt = xb + 1.5*offset;
	var yt = yb + offset;
	var wt = 120//wb - 4*offset;
	//var ht = hb - 2*offset;

	draw_sprite_stretched(spr_gui_back, 0, xb, yb, wb, hb)
	for (var i=0; i<array_length(text); i++){
		draw_text_transformed(xt, yt + i*tsep, text[i], tscale, tscale, 0);
	}

}