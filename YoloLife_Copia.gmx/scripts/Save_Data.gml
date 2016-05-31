/// Save_Data(filename, grid, variable_type, fill[?])
var filename = argument[0];
var grid = ds_grid_create(1, 2);
ds_grid_copy(grid, argument[1]);
var variable_type = argument[2];
var fill_ = argument[3];

// Fill the grid.
if(fill_){
  //  ds_grid_add(grid, 1, 0, "");
   // ds_grid_add(grid, 1, 1, "");
}

// Delete the file!
if(file_exists(filename + ".sav")){
    file_delete(filename + ".sav");
}

// Get grid width.
var width = ds_grid_width(grid);

// Create and populate the map
var map = ds_map_create();


// Populate the value grid.
switch(variable_type){
    case "single":
        for(var i = 0; i < width; i++){ 
            var single = ds_grid_get(grid, i, 1);
            if(single != noone){
                var key = ds_grid_get(grid, i, 0);
                if(key != ""){
                    ds_map_add(map, key, single);
                }
            }
        }
    break;
    case "grid":
        for(var i = 0; i < width; i++){
            var grid_ = ds_grid_get(grid, i, 1);
            if(grid_ != noone){
                var key = ds_grid_get(grid, i, 0);
                if(key != ""){
                    ds_map_add(map, key, ds_grid_write(grid_));
                }
            }
        }
    break;
    case "list":
        for(var i = 0; i < width; i++){
            var list_ = ds_grid_get(grid, i, 1);
            if(list_ != noone){
                var key = ds_grid_get(grid, i, 0);
                if(key != ""){
                    ds_map_add(map, key, ds_list_write(list_));
                }
            }
        }
    break;
}

// Save the map.
ds_map_secure_save(map, filename + ".sav");
