/// Draw_Powerups(variable, sprite, yplus);
variable = argument[0];
sprite = argument[1];
yplus = argument[2];

var xx = x + 27;
var restar = false;

draw_sprite(sprite, 0, xx, y + yplus); 
draw_text(xx - string_width(string(variable))/2 - 4, y + yplus + sprite_get_height(sprite)/2, 'x' + string(variable));
if(in_Rectangle(xx - sprite_get_width(sprite)/2, y + yplus - sprite_get_height(sprite)/2, 
                xx + sprite_get_width(sprite)/2, y + yplus + sprite_get_height(sprite)/2) and mouse_check_button_released(mb_left))
{
    // Activate Power!   
    switch(sprite){
        case spr_freeze:
            if(!instance_exists(Power_Freeze) and !instance_exists(Power_Slowdown)){
                if(variable > 0){             
                    ds_list_replace(powerups, 0, variable - 1);
                    instance_create(0,0, Power_Freeze);           
                    if(!audio_is_playing(sn_countdown)){
                        audio_play_sound(sn_countdown, 1, 0);
                    }        
                }
            }
        break;
        case spr_slowdown:
            if(!instance_exists(Power_Slowdown) and !instance_exists(Power_Freeze)){
                if(variable > 0){
                    ds_list_replace(powerups, 1, variable - 1);
                    instance_create(0,0, Power_Slowdown);
                    if(!audio_is_playing(sn_countdown)){
                        audio_play_sound(sn_countdown, 1, 0);
                    }
                }
            }
        break;
        case spr_puerta:
            if(instance_exists(Inicio)){
                if(variable > 0){
                    ds_list_replace(powerups, 2, variable - 1);
                    with Inicio instance_destroy();
                    with(Per){ 
                        pre_x = x;
                        pre_y = y;
                        instance_create(pre_x + sprite_get_width(spr_puerta)/2 - 4, pre_y + sprite_get_height(spr_puerta)/2- 7, Inicio);
                    }
                    
                    // Increase Achievement.
                    Increase_Amount("You have used 15 times the#checkpoint power!", 1);
                    
                    // Play Sound.
                    if(!audio_is_playing(sn_powerup_general)){
                        audio_play_sound(sn_powerup_general, 1, 0);
                    }
                }
            }
        break;
        /*case spr_bubble_shield:    
        break;*/
    }
}  
