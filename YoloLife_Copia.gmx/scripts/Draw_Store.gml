/// Draw_Store(num, title, sprite)
num = argument[0];
ti = argument[1];
sprite = argument[2];

var xx = x + 87;

// Draw the products.
for(var i = 0; i < num; i++)
{
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
    
    // Draw neon bar.
    if(i == 2 or i == 3){
        draw_sprite(spr_neonbar, 0, xx + 34, yy+13);
    }
       
    // Draw the current bar.
    //draw_sprite(spr_box_tienda, 0, xx, yy);
    if(i != 0){
        draw_sprite(spr_box_tienda, 0, xx, yy);
    }else{
        draw_set_alpha(.5);
        draw_sprite(spr_box_tienda, 0, xx, yy);
        draw_set_alpha(1);
    }

    // Draw the product icon.
    if(i != 0){
        draw_sprite(sprite, i, xx + 57 - 4, yy + 13 - 5); 
    }else{
        draw_set_alpha(.5);
        draw_sprite(sprite, i, xx + 57 - 4, yy + 13 - 5); 
        draw_set_alpha(1);
    }
    
    // Draw the text corresponding to this item.
    draw_set_font(font_rayman_niveles15);
    draw_set_color(c_white);
    if(i != 0){
        draw_text(xx + 125, yy + 22, ti[i+1]);
    }else{
        draw_set_alpha(.5);
        draw_text(xx + 125, yy + 22, ti[i+1]);
        draw_set_alpha(1);
    }
 
    // Check if we tapped with less than 10px of drag
    if (point_distance(pressed, 0, released, 0) < 10){
        // They want to select a product.
        item_pressed = i;
        switch(i){  
            case 0:
                category = "money";
                if(idioma == "en"){
                    show_message('Comming soon');
                }else if(idioma == "es"){
                    show_message('Disponible próximamente');
                }
            break; 
            case 1:
                category = "powers";
            break;
            case 2:
                category = "skins";
            break;
            case 3:
                category = "gems";
            break;
        }
        
        if(category != "money"){
            audio_play_sound(sn_boton_general, 1, 0);
            room_goto_transition(Room_Market_Gems, 0);
        }
        //room_goto_transition(Room_Market_Gems, 11, 20);
        released = -99999;
    }
    
    // Icrease offset and height
    yy += 82;
    height += 95;
     
}
