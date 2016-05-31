/// Draw_NonDurable_Products(num, category, array, title, description, sprite, sprite_type[array or sprite])
num = argument[0];
type = argument[1]; // Money: 0; Powers: 1; Skins: 2; Gems: 3.
array = argument[2];
ti = argument[3];
des = argument[4];
sprite = argument[5];
type_sprite = argument[6];

var xx = x + 87;

// Draw the products.
for(var i = 0; i < num; i++)
{
    // Get Price!      
    var list = Get_Price(ds_list_find_value(array, i));
    var precio = ds_list_find_value(list, 0);
    
    // This will check if we are currently pressing this item
    if(in_Rectangle(151, yy, 151 + sprite_get_width(spr_box_tienda), yy + 80)){

        // Check to see if the the mouse is pressed.
        if (mouse_check_button_pressed(mb_left)){
            pressed = mouse_y;
        }
        
        // Check to see if the the mouse is released.
        if (mouse_check_button_released(mb_left)){
            released = mouse_y;
        }
    }
       
    
    // A products has not been selected.
    if(item_pressed != i){
    
        // Draw the current bar.
        draw_sprite(spr_box_tienda, 0, xx, yy);
        
    // A product has been selected.
    }else{
        // Draw a bigger current bar.   
        draw_sprite(spr_box_tienda, 1, xx, yy);
         
        // Draw the buy buttom.       
        draw_set_font(font_rayman_niveles15);
        if(!in_Rectangle(xx + 457 - 4, yy + 80, xx + 457 - 4 + sprite_get_width(spr_buttom_market), yy + 80 + sprite_get_height(spr_buttom_market))){
            draw_set_color(c_yellow);
            draw_sprite(spr_buttom_market, 0,xx + 457 - 4, yy + 80);
        }else{
            draw_set_color(c_white);
            draw_sprite(spr_buttom_market, 1,xx + 457 - 4, yy + 80);
            
            // The player wants to buy this product!
            if(mouse_check_button_released(mb_left)){
                    
                    // Get Price!
                    //var list = Get_Price(ds_list_find_value(array, i));
                    //var precio = ds_list_find_value(list, 0);
                    
                    // The Player has enough money.
                    if(global_monedas >= precio){
                    
                        // Save the new coins.
                        global_monedas -= precio;
                        var grid1 = ds_grid_create(1,2);
                        ds_grid_add(grid1, 0, 0, "key_monedas");
                        ds_grid_add(grid1, 0, 1, global_monedas);
                        Save_Data("Monedas_", grid1, "single", true);
                                                
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
                        
                        // Process the buy.
                        Process_Buy(i, num_category);
                        
                    //The player doesn't have enought coins.
                    }else{
                        // Display buy coins.
                        if(idioma == "en"){
                           show_message_async("Store is not available.");
                        }else if(idioma == "es"){
                           show_message_async("La tienda no está disponible.");
                        }
                    }
            }
        }
        
        // If Watch Video!
        draw_set_font(font_rayman_niveles18);
        if(num_category == 0){
            if(i == 0){
                draw_text(xx + 458+30+1, yy + 90-3+5,botones[2]); // Watch!
            }else{
                draw_text(xx + 458+30+1, yy + 90-3+5,botones[0]); // Buy!
            }
        }else{
            draw_text(xx + 458+30+1, yy + 90-3+5,botones[0]);
        }
        
        // Draw the description.
        draw_set_color(c_white);
        draw_set_font(font_rayman_niveles15);
        draw_text(xx + 75 - 25+3, yy+80, des[i+1]);
    }
    
    
    // Draw the product icon.
  //  if(type_sprite == "list"){
        draw_sprite(sprite[i], 0, xx+82, yy+37);
  //  }else{
      //  draw_sprite(sprite, i, xx + 20, yy + 24); 
  //  }
    
    // Draw the text corresponding to this item.
    draw_set_font(font_rayman_niveles15);
    draw_set_color(c_white);
    draw_text(xx + 125, yy + 24, ti[i+1]);
    
    // Draw the price unless you have already bought this product.
    var xs = x + 90 + sprite_get_width(spr_box_tienda) -  90;
    
    // If category different than "money"
    if(num_category != 0){  

        // Get Price!
        //var list = Get_Price(ds_list_find_value(array, i));
        //var precio = ds_list_find_value(list, 0);
        var sprite_coins = ds_list_find_value(list, 1);
        var color_coins = ds_list_find_value(list, 2);
        
        draw_set_color(color_coins);
        draw_sprite(sprite_coins, 0, xs, yy + 22);
        draw_text(xs - string_width(string(precio)) - 4, yy + 22, string(precio));
    }else{
       // var precio = ds_list_find_value(precios_money, i);
       // draw_text(xs - 20, yy + 20, string(precio));
    }
    
    // Check if we tapped with less than 10px of drag
    if (point_distance(pressed, 0, released, 0) < 10){
        // They want to select a product.
        if(item_pressed == -1){
            item_pressed = i;
        
        // The want to hide the product.
        }else if(item_pressed == i){
            item_pressed = -1;
        
            
        // They want to change the selected product.
        }else if(item_pressed != -1 and !in_Rectangle(xx + 457 - 4, yy + 80, xx + 457 - 4 + sprite_get_width(spr_buttom_market), yy + 80 + sprite_get_height(spr_buttom_market))){
            item_pressed = i;
    

        }
        audio_play_sound(sn_boton_general, 1, 0);
        released = -99999;
    }
    
    // Icrease offset and height
     if(item_pressed == -1){
        yy += 82;
        height += 90;
     }else{
        if(item_pressed == i){
            yy += 82*2;
            height += 82*2 + 50;
        }else{
            yy += 82 + 5;
            height += 90;
        }
    }
}
