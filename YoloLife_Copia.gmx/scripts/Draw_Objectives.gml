/// Draw_Objectives()
draw_set_color(c_white);
draw_set_font(font_rayman_niveles15);
var xs = view_xview[0] + 708 - 71 - sprite_get_width(spr_monedas) - string_width(string(global_monedas))/2 + 13
var already_completed = ds_grid_get(level_object, nivel_selected - 1, 1);

// Set color variables.
var color_red = c_red; // make_color_rgb(255, 102, 102);
var color_green = c_green; //make_color_rgb(153, 204, 51);

if(!already_completed){
    switch(objetivo){
        case "objeto":
            if(instance_exists(Objeto)){
                draw_sprite_ext(spr_diamante, 0, xs - 60, 25, 1, 1, 0, c_black, .9);
            }else{
                draw_sprite(spr_diamante, 0, xs - 60, 25);
            }
        break;
        case "nodeads":
        
            // Set the color.
            if(muertes > 0) draw_set_color(color_red);
            else draw_set_color(color_green);    
        
        
            var text = string(muertes) + ' < 0';
            draw_text(xs - string_width(text) - 50, 20, string(muertes) + ' < 0');
        break;
        case "matarse_con":
       
        break;
        case "igual_muertes":
        
            // Set the color.
            if(muertes != cantidad) draw_set_color(color_red);
            else draw_set_color(color_green);
        
            var text = string(muertes) + '/' + string(cantidad);
            draw_text(xs - string_width(text) - 50, 20, text);
            
        break;
        case "menos_muertes":
        
            // Set the color.
            if(muertes < cantidad) draw_set_color(color_green);
            else draw_set_color(color_red);
        
            var text = string(muertes) + ' < ' + string(cantidad);
            draw_text(xs - string_width(text) - 50, 20, text);
        break;
        
        // There is not objective.   
        default:
          //  return -1;
        break
    }
}//else{
   // return -1;
//}
//return 0;
