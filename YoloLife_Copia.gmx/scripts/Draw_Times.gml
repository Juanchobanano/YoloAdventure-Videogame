/// Draw_Times.
lvl = argument[0];

var oro = ds_grid_get(tiempo_niveles, lvl, 0);
var plata = ds_grid_get(tiempo_niveles, lvl, 1);

// Draw!
draw_set_color(c_white);
draw_set_font(font_rayman_niveles12);
var xs = 64 + 320 + sprite_get_width(spr_medal_oro) + 25;

draw_text(x + xs, 190, "0s - " + string(oro) + 's');
draw_text(x + xs, 245, " > " + string(oro) + 's - ' + string(plata) + 's');
draw_text(x + xs, 300, "> " + string(plata) + 's - ...' );
