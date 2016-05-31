/// Process_Buy(product[i], category)
var product = argument[0];
var cat = argument[1];

// 0: Money, 1: Poderes.
switch(cat){
    case 0:
        switch(product){
            case 1:
                product_iap = "";
            break;
            case 2:
                product_iap = "";
            break;
            case 3:
                product_iap = "";
            break;
            case 4:
                product_iap = "";
            break;
        }
         
        // Processs IAP request.
        if(iap_status() == iap_status_available){
           iap_acquire(product, ""); // Evento A.
        }else{
           if(idioma == "en"){
              show_message_async("Store is not available.");
           }else if(idioma == "es"){
              show_message_async("La tienda no está disponible.");
           }
        }
            
    break;
    case 1:
        // 0: Freeze, 1: Slow, 2: Checkpoint.
        var pre_value = ds_list_find_value(powerups, product);
        switch(product){
            case 0:
                ds_list_replace(powerups, product, pre_value + 5);
            break;
            case 1:
                ds_list_replace(powerups, product, pre_value + 5);            
            break;
            case 2:
                ds_list_replace(powerups, product, pre_value + 5);
            break;
        }
        
        // Play selection sound!
        audio_play_sound(sn_compra, 2, 0);    
        
        /// Save List.
        var grid1 = ds_grid_create(1,2);
        ds_grid_add(grid1, 0, 0, "key_powers");
        ds_grid_add(grid1, 0, 1,  powerups);
        Save_Data("PowerUps", grid1, "list", true);
    break;
}
