/// Create_Medals(xx, count)
xs = argument[0];
cuenta = argument[1];

// Draw the current item with its medal.
var medallas = ds_list_find_value(medallas_niveles, cuenta);

// There's a medal to be created.
if(medallas > 0){
    var inst = instance_create(xs, yy_marco + sprite_get_height(spr_level) - sprite_get_height(sprite) + 10, Medalla);
    switch(medallas){
        case 1:
            with(inst){ sprite_index = spr_medal_bronce; }
        break;
        case 2:
            with(inst){ sprite_index = spr_medal_plata; }
        break;
        case 3:
            with(inst){ sprite_index = spr_medal_oro; }
        break;
    }
}
