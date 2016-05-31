/// Organize_Products()
var array_grid = argument[0];

// Copy the grid and organize it.
grid = ds_grid_create(ds_grid_width(array_grid), ds_grid_height(array_grid));
ds_grid_copy(grid, array_grid);

// Repeat the procces ds_grid_width(grid) times.
repeat(ds_grid_width(grid)){
    for(var i = 1; i < ds_grid_width(grid); i++){    
        
        var precio = ds_grid_get(grid, i, 0);
        var comprado = ds_grid_get(grid, i, 1);
        
        // If the player completed the achievement and already claimed his reward.
        if(comprado and i < ds_grid_width(grid) - 1){
        
             // Change the text.
             var ti_copia = ti[i+1];
             ti[i+1] = ti[i];
             ti[i] = ti_copia;
             
             var des_copia = des[i+1];
             des[i+1] = des[i];
             des[i] = des_copia;
             
             // Change the value of the grid in that position.
             var next_precio = ds_grid_get(grid, i + 1, 0);
             var next_comprado = ds_grid_get(grid, i + 1, 1);

             ds_grid_set(grid, i + 1, 0, ds_grid_get(grid, i, 0));
             ds_grid_set(grid, i + 1, 1, ds_grid_get(grid, i, 1));
             
             ds_grid_set(grid, i, 0, next_precio);
             ds_grid_set(grid, i, 1, next_comprado);
             
        }
    }
}

return grid;
