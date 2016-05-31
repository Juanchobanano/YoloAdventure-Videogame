/// Desintegrate_Sprite(sprite)
spr = argument[0];
index = argument[1];
meta_x = argument[2];
meta_y = argument[3];

// Set local variables.
var spr_width = sprite_get_width(spr);
var spr_height = sprite_get_height(spr);

var par_dimx = spr_width / (spr_width/2);
var par_dimy = spr_height / (spr_height/2);

// Create grid.
grid = ds_grid_create(spr_width, spr_height);

// Fill the grid.
for(var i = 0; i < spr_height; i++){
    for(var j = 0; j < spr_width; j++){
        // Draw the part of the sprite in that position of the grid.
        ds_grid_add(grid, j, i, draw_sprite_part(spr, index, j * pardimx, i * pardimy, par_dimx, pardimy, x + j * pardimx, y + i * pardimy)); 
    }
}


