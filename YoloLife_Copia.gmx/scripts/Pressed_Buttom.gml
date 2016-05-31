/// Pressed_Buttom(item_comprado, num_item, precio)
var item_comprado = argument[0];
var num_item = argument[1];
var precio = argument[2];
var grid = argument[3];
var selected = argument[4];
// The player wants to buy this product or select it!

// If the player hasn't bought this product.
if(!item_comprado){

    // The Player has enough money.
    if(global_monedas >= precio){
    
        // Save the coins.
        global_monedas -= precio;
        var grid0 = ds_grid_create(1,2);
        ds_grid_add(grid0, 0, 0, "key_monedas");
        ds_grid_add(grid0, 0, 1, global_monedas);
        Save_Data("Monedas_", grid0, "single", true);
        
        // Play BUY sound!
        audio_play_sound(sn_winlevel, 2, 0);    
        audio_play_sound(sn_aplausos, 2, 0);    
        audio_sound_gain(sn_aplausos, .5, 1);    
        //audio_sound_gain(audio, .2, 1);
         
        // Animación de Compra.
        if(!instance_exists(Level_Completed)){
            var inst = instance_create(0,0, Level_Completed);
            with(inst){
                if(idioma == "en"){
                    text = "Purchase Made!";
                }else if(idioma == "es"){
                    text = "Compra realizada!";
                }
            }
        }
    
        // Select this product and return a value.
        ds_grid_set(grid, num_item, 1, true);
        if(selected == "skin_selected"){
            skin_selected = num_item;
        }else{
            gema_selected = num_item;
        }
        
        /// Save Store Singles variables.
        var grid1 = ds_grid_create(1,2);
        ds_grid_add(grid1, 0, 0, "key_skinselected");
        ds_grid_set(grid1, 0, 1,  skin_selected);
        Save_Data("Store_SkinSelected", grid1, "single", true);
        
        var grid2 = ds_grid_create(1,2);
        ds_grid_add(grid2, 0, 0, "key_gemaselected");
        ds_grid_set(grid2, 0, 1,  gema_selected);
        Save_Data("Store_GemSelected", grid2, "single", true);

        // Save the Store Grids variables.    
        var grid3 = ds_grid_create(1,2);
        ds_grid_add(grid3, 0, 0, "key_store_skinsprecio");
        ds_grid_set(grid3, 0, 1,  skins_precio);
        Save_Data("Store_Grid_Skin", grid3, "grid", true);
        
        var grid4 = ds_grid_create(1,2);
        ds_grid_add(grid4, 0, 0, "key_store_gemsprecio");
        ds_grid_set(grid4, 0, 1,  gems_precio);
        Save_Data("Store_Grid_Gems", grid4, "grid", true); 
        
        // The Player doesn't have enough money.
        }else{
            // Display the buy coins.
            if(idioma == "en"){
               show_message_async("Store is not available.");
            }else if(idioma == "es"){
               show_message_async("La tienda no está disponible.");
            }
        }  
        
        
// The player already has this product and wants to select it.
}else{
    if(selected == "skin_selected"){
        skin_selected = num_item;
    }else{
        gema_selected = num_item;
    }
    
    /// Save Store Singles variables.
    var grid1 = ds_grid_create(1,2);
    ds_grid_add(grid1, 0, 0, "key_skinselected");
    ds_grid_set(grid1, 0, 1,  skin_selected);
    Save_Data("Store_SkinSelected", grid1, "single", true);
    
    var grid2 = ds_grid_create(1,2);
    ds_grid_add(grid2, 0, 0, "key_gemaselected");
    ds_grid_set(grid2, 0, 1,  gema_selected);
    Save_Data("Store_GemSelected", grid2, "single", true);
    
    // Play selection sound!
    audio_play_sound(sn_select, 2, 0);    

    // Animación de Seleccion..
    if(!instance_exists(Level_Completed)){
        var inst = instance_create(0,0, Level_Completed);
        with(inst){
            if(idioma == "en"){
                text = "Selection Made!";
            }else if(idioma == "es"){
                text = "Seleccion realizada!";
            }
        }
    }
}

