// Declare the lists.
skins_precio = ds_grid_create(11, 2);   
gems_precio = ds_grid_create(6, 2);
powers_precio = ds_list_create();
money_precio = ds_list_create();

/// Fill the lists.

    // Powers Price.
    ds_list_add(powers_precio, "300g"); // 229
    ds_list_add(powers_precio, "250g"); // 157
    ds_list_add(powers_precio, "350g"); // 353
    
    // Money Price.

    
    // Skins Price.
    ds_grid_add(skins_precio, 0, 0, "0g"); // Classic.
    ds_grid_add(skins_precio, 1, 0, "400g"); // Colombia.
    ds_grid_add(skins_precio, 2, 0, "400g"); // Chile.
    ds_grid_add(skins_precio, 3, 0, "400g"); // Argentina.
    ds_grid_add(skins_precio, 4, 0, "400g"); // Mexico.
    ds_grid_add(skins_precio, 5, 0, "400g"); // Costa Rica.
    ds_grid_add(skins_precio, 6, 0, "400g"); // EEUU
    ds_grid_add(skins_precio, 7, 0, "400g"); // Alemania.
    ds_grid_add(skins_precio, 8, 0, "400g"); // Espana.
    ds_grid_add(skins_precio, 9, 0, "400g"); // Guatemala.
    ds_grid_add(skins_precio, 10, 0, "400g"); // Inglaterra. 
    
      // Gems Price.
    ds_grid_add(gems_precio, 0, 0, "0g"); // Clasica.
    ds_grid_add(gems_precio, 1, 0, "200g"); // Gravedad.
    ds_grid_add(gems_precio, 2, 0, "250g"); // Salto
    ds_grid_add(gems_precio, 3, 0, "750g"); // Barras x2
    ds_grid_add(gems_precio, 4, 0, "650g"); // Atraer oro!
    ds_grid_add(gems_precio, 5, 0, "750g"); // Movimiento!

    
// Fill the skins_precio array with 0.
for(var i = 0; i < ds_grid_width(skins_precio); i++){
    ds_grid_set(skins_precio, i, 1, false);
}
ds_grid_set(skins_precio, 0, 1, true);

// Fill the gems_precio array with 0.
for(var i = 0; i < ds_grid_width(gems_precio); i++){
    ds_grid_set(gems_precio, i, 1, false);
}
ds_grid_set(gems_precio, 0, 1, true);

skin_selected = 0;
gema_selected = 0;
