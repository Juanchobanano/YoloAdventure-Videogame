// Fill the position y:0 of the grid with 0s.
for(var i = 0; i < 11; i++){
    ds_grid_set(logros, i, 0, 0); // 0
}

// Set the total values.
ds_grid_set(logros, 0, 1, 1);
ds_grid_set(logros, 1, 1, 5);
ds_grid_set(logros, 2, 1, 5);
ds_grid_set(logros, 3, 1, 15);
ds_grid_set(logros, 4, 1, 50);
ds_grid_set(logros, 5, 1, 30);
ds_grid_set(logros, 6, 1, 500);
ds_grid_set(logros, 7, 1, 25);
ds_grid_set(logros, 8, 1, 15);
ds_grid_set(logros, 9, 1, 15);
ds_grid_set(logros, 10, 1, 500);
//ds_grid_set(logros, nivel, 1, cantidad_de_pasos);

// Set the reward.
ds_grid_set(logros, 0, 2, 50);
ds_grid_set(logros, 1, 2, 100);
ds_grid_set(logros, 2, 2, 30);
ds_grid_set(logros, 3, 2, 50);
ds_grid_set(logros, 4, 2, 100);
ds_grid_set(logros, 5, 2, 100);
ds_grid_set(logros, 6, 2, 50);
ds_grid_set(logros, 7, 2, 50);
ds_grid_set(logros, 8, 2, 50);
ds_grid_set(logros, 9, 2, 50);
ds_grid_set(logros, 10, 2, 50);
//ds_grid_set(logros, nivel, 2, recompensa);

// Set rewards claimer booleans
for(var i = 0; i < 11; i++){
    ds_grid_set(logros, i, 3, false);
}
