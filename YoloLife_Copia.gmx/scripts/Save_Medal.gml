/// Save_Medal(new_medal, new_time);
var new_medal = argument[0];
var new_time = argument[1];
var save = false;

var last_medal = ds_grid_get(medallas_niveles, nivel_selected - 1, 0);
var last_time = ds_grid_get(medallas_niveles, nivel_selected - 1, 1);

if(new_medal > last_medal){
    ds_grid_set(medallas_niveles, nivel_selected - 1, 0, new_medal);
    save = true;
}

if(new_time < last_time or last_time == 0){
    if(last_time == 0){
        // Increase Achievement Amount.
        Increase_Amount("Complete 30 levels of the#world!", 1);
    }   
    ds_grid_set(medallas_niveles, nivel_selected - 1, 1, time);
    save = true;
}

if(save){
    var grid1 = ds_grid_create(1,2);
    ds_grid_add(grid1, 0, 0, "key_medallas");
    ds_grid_add(grid1, 0, 1,  medallas_niveles);
    Save_Data("Medallas", grid1, "grid", true);
}
