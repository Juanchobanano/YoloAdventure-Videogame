/// Load_Data(filename, grid, variable_type)
var filename = argument[0];
var grid = ds_grid_create(ds_grid_width(argument[1]), ds_grid_height(argument[1]));
ds_grid_copy(grid, argument[1]);
var variable_type = argument[2];



// Get grid width.
var width = ds_grid_width(grid);

if(file_exists(filename + ".sav")){

    var map = ds_map_secure_load(filename + ".sav");
    for(var i = 0; i < width; i++){
            
        // Get values and variables.
        var key__ = ds_grid_get(grid, i, 0);
        var variable = ds_grid_get(grid, i, 1);
        var value = ds_map_find_value(map, key__);
        
        switch(variable_type){
            case "list":
                if(value != ""){ ds_list_read(variable, value); }
            break;
            case "grid":
                if(value != ""){ ds_grid_read(variable, value); }
            break;
            case "single":
                 switch(key__){
                    case "key_monedas":
                        global_monedas = value;
                    break;
                    case "key_skinselected":
                        skin_selected = value;
                    break;
                    case "key_gemaselected":
                        gema_selected = value;
                    break;
                 }
            break;
        }
    }
}
