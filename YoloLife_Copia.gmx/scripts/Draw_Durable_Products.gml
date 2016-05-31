/// Draw_Durable_Products(num, category, array, title, description, sprite, sprite_type)
num = argument[0];
type = argument[1]; // Money: 0; Powers: 1; Skins: 2; Gems: 3.
array = argument[2];
ti = argument[3];
des = argument[4];
sprite = argument[5];
type_sprite = argument[6];

xx = x + 87;

// Bring the bool arrays (BUY or BOUGHT)
switch(type){
    case 2: // Skins.
        selected = skin_selected;
        strings = "skin_selected";
    break;
    case 3: // Gems.
        selected = gema_selected;
        strings = "gem_selected";
    break;
}

// Draw the products.
for(var i = 0; i < num; i++)
{
    // Get Price!
    var list = Get_Price(string(ds_grid_get(array, i, 0)));
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
       
    // Does the player already bought this product?
    var item_comprado = ds_grid_get(array, i, 1); // bool array

    
    // A products has not been selected.
    if(item_pressed != i){
    
        // Draw the current bar.
        draw_sprite(spr_box_tienda, 0, xx, yy);
        
        // The product is selected. (skins, gems _selecteD)
        if(selected == i){
            // Draw OK.
            draw_sprite(spr_gotit_tienda, 0, xx + 91, yy + 30);
            
            // Draw neon bar.
            draw_sprite(spr_neonbar, 0, xx+  34, yy+13);
            
        }else if(item_comprado){
            draw_sprite(spr_neonbar, 0, xx+  34, yy+13);
        }
        
    // A product has been selected.
    }else{
    
        // Draw a bigger current bar.   
        draw_sprite(spr_box_tienda, 1, xx, yy);
        
         // Draw the description.
        draw_set_color(c_white);
        draw_set_font(font_rayman_niveles12);
        draw_text(xx + 75 - 25+3, yy+80, des[i+1]);
                         
        // This product is not selected. (skins, gems _selecteD)         
        if(selected != i){
             // Draw the buttom.       
            draw_set_font(font_rayman_niveles15);
            if(!in_Rectangle(xx + 457 - 4, yy + 80, xx + 457 - 4 + sprite_get_width(spr_buttom_market), yy + 80 + sprite_get_height(spr_buttom_market))){
                draw_set_color(c_yellow);
                draw_sprite(spr_buttom_market, 0,xx + 457 - 4, yy + 80);
            }else{
                draw_set_color(c_white);
                draw_sprite(spr_buttom_market, 1,xx + 457 - 4, yy + 80);
                        
            
               // If the player doesn't have this product can buy it.
               // If the player have this product and wants to selected, he can do it.
              
                if(mouse_check_button_released(mb_left)) Pressed_Buttom(item_comprado, i, precio, array, strings);
            }   
            
            // Draw the buttom text if the player doesn't have select this item.
            if(!item_comprado){
                draw_text(xx + 458+30+1, yy + 90-3+5, botones[0]); // Buy.
            }else{
                draw_text(xx + 458+16+5, yy + 90-3+5,botones[1]); // Equip!
                
                // Draw neon bar.
                draw_sprite(spr_neonbar, 0, xx+  34, yy+13);
            }
            
        // This product is selected (skins, gems _selecteD)!
        }else{
            
        
            // Draw OK.
            draw_sprite(spr_gotit_tienda, 0, xx + 91, yy + 30);
            
            // Draw neon bar.
            draw_sprite(spr_neonbar, 0, xx + 34, yy+13);
        
        }
        
            
    }
    
    
    // Draw the product icon.
    draw_sprite(spr_gems, gema_selected, xx + 82 - 12, yy + 37 - 12); 
    if(type != 3){ // If the type is different from gems.
        draw_sprite(sprite, i, xx + 82 - 12, yy + 37 - 12);
    }else{
        draw_sprite(sprite, i, xx + 82 - 24,  yy + 37 - 24);
    }
    
    // Draw the text corresponding to this item.
    draw_set_font(font_rayman_niveles15);
    draw_set_color(c_white);
    
    var yyplus = 0;
    if(type == 2){
        var yyplus = 9; 
    }
    draw_text(xx + 132, yy + 22 - yyplus, ti[i+1]);
    
    
    // If the player hasn't buy this product, draw the price.
    if(!item_comprado){
        // Draw the price unless you have already bought this product.
        var xs = x + 90 + sprite_get_width(spr_box_tienda) -  90;
        
        // Get Settings!
        var sprite_coins = ds_list_find_value(list, 1);
        var color_coins = ds_list_find_value(list, 2);
        
        draw_set_color(color_coins);
        draw_sprite(sprite_coins, 0, xs, yy + 22);
        draw_text(xs - string_width(string(precio)) - 4, yy + 22, string(precio));
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
        height += 82;
     }else{
        if(item_pressed == i){
            yy += 82*2;
            height += 82*2 + 50;
        }else{
            yy += 82;
            height += 82;
        }
    }
}
