/// Load_Game()
var grid1 = ds_grid_create(1,2);

// Logros. 
    ds_grid_add(grid1, 0, 0, "key_logros");
    ds_grid_add(grid1, 0, 1, logros);
    Load_Data("Logros", grid1, "grid");
    
// Monedas. End Room-Game. Draw_NonDurable. Process_Buy

    ds_grid_set(grid1, 0, 0, "key_monedas");
    ds_grid_set(grid1, 0, 1,  global_monedas);
    Load_Data("Monedas_", grid1, "single");

//  Powerups. Draw_Powerups. Process_Buy.
    ds_grid_set(grid1, 0, 0, "key_powers");
    ds_grid_set(grid1, 0, 1,  powerups);
    Load_Data("PowerUps", grid1, "list");
    
// Medallas. Save_Medal.
    ds_grid_set(grid1, 0, 0, "key_medallas");
    ds_grid_set(grid1, 0, 1,  medallas_niveles);
    Load_Data("Medallas", grid1, "grid");

// Objectives. Check_Objectives.
    ds_grid_set(grid1, 0, 0, "key_objective");
    ds_grid_set(grid1, 0, 1,  level_object);
    Load_Data("Objectives", grid1, "grid");
        
// Store. (PRESSED_BUTTOM())

    // Store single variables.
    ds_grid_set(grid1, 0, 0, "key_skinselected");
    ds_grid_set(grid1, 0, 1,  skin_selected);
    Load_Data("Store_SkinSelected", grid1, "single");
    
    ds_grid_set(grid1, 0, 0, "key_gemaselected");
    ds_grid_set(grid1, 0, 1,  gema_selected);
    Load_Data("Store_GemSelected", grid1, "single");

    // Store grids. 
    ds_grid_set(grid1, 0, 0, "key_store_skinsprecio");
    ds_grid_set(grid1, 0, 1, skins_precio);
    Load_Data("Store_Grid_Skin", grid1, "grid");
    
    ds_grid_set(grid1, 0, 0, "key_store_gemsprecio");
    ds_grid_set(grid1, 0, 1, gems_precio);
    Load_Data("Store_Grid_Gems", grid1, "grid");
    
// Tutoriales.
    globalvar tuto_teclas, tuto_poderes;
    tuto_teclas = false;
    tuto_poderes = false;
    
    if(file_exists(working_directory + "Tutorial.sav")){
        ini_open(working_directory + "Tutorial.sav");
        tuto_teclas = ini_read_real("tuto_teclas", "pass", 0);
        tuto_poderes = ini_read_real("tuto_poderes", "pass", 0);
        ini_close();
    }
