/// Draw Achievements(num)
var num = argument[0];
var index = 0;
var color = make_color_rgb(33, 176, 218);
var xx = 151;

// Draw the achievements.
for(var i = 0; i < num; i++){

    // Set text configuration.
    draw_set_color(c_white);
    draw_set_font(font_rayman_niveles12);

    // Get the amount of the achievemnent.
    var amount = ds_grid_get(grid, i, 0);
    
    // Get the reward amount and the took reward bool.
    var reward_amount = ds_grid_get(grid, i, 2);
    var took_reward = ds_grid_get(grid, i, 3);
    //show_debug_message('took' + string(took_reward));
        
    // If the player completed the achievement.
    if(amount >= ds_grid_get(grid, i, 1)){
        // Dibujar frame.
        draw_sprite(spr_box_achievement, 1, xx, yy_marco);

        // Draw the coin sprite.
        if(!took_reward){
            if(in_Rectangle(151, yy_marco, 151 + sprite_get_width(spr_box_achievement), yy_marco + sprite_get_height(spr_box_achievement))){
                draw_sprite(spr_box_achievement, 1, xx, yy_marco);
                if(mouse_check_button_released(mb_left)){
                
                    // Take reward.
                    ds_grid_set(logros, i, 3, true);
                    ds_grid_set(grid, i, 3, true);
                    
                    // Save this grid.
                    var grid1 = ds_grid_create(1,2);
                    ds_grid_add(grid1, 0, 0, "key_logros");
                    ds_grid_add(grid1, 0, 1, logros);
                    Save_Data("Logros", grid1, "grid", true);
                    
                    // Recieve reward.
                    Take_Reward(reward_amount); // Reward amount.
                    
                    // Play sounds!
                    audio_play_sound(sn_winlevel, 1, 0);
                    audio_play_sound(sn_aplausos, 1, 0);
                    audio_sound_gain(sn_aplausos, .5, 1);
                    audio_sound_gain(audio, .2, 1);
                    
                    // Create congratulations banner!.
                    var inst = instance_create(0,0, Level_Completed);
                    with(inst){
                        depth = Logros.depth - 2;
                        if(idioma == "en"){
                            text = "Congratulations! Goal completed!";
                        }else if(idioma == "es"){ 
                            text = "Felicitaciones! Logro completado!";
                        }
                    }
                    
                }
            }
            draw_text(542, yy_marco + 24, string(reward_amount));
            draw_sprite(spr_monedas, 0, 542 + string_width(string(reward_amount)), yy_marco + 24);
        }else{
            draw_sprite(spr_gotit, 0, 542, yy_marco + 24);
        }
        
        // Draw the achievement icon.
        draw_sprite(spr_mask, 1, xx + 25, yy_marco + 22);
    }else{
        // Dibujar frame.
        draw_sprite(spr_box_achievement, 0, xx, yy_marco);
        // Dibujar cuanto le falta al jugador.
        draw_text(542, yy_marco + 24, string(amount) + "/" + string(ds_grid_get(grid, i, 1)));
        // Draw the achievement icon.
        draw_sprite(spr_mask, 0, xx + 25, yy_marco + 22);
        // Draw the reward.
        draw_text(542, yy_marco + 39, string(reward_amount));
        draw_sprite(spr_monedas, 0, 542 + string_width(string(reward_amount)), yy_marco + 39);
    }
    
    // Draw the health var.
    var percent = (amount / ds_grid_get(grid, i, 1) * 100);
    var xbar = xx + sprite_get_width(spr_mask) + 20;
    var ybar = yy_marco + 24 + string_height(txt[i]) + 2;
    draw_healthbar(xbar, ybar, 511, ybar + 2, percent, color, c_white, c_white, 0, true, false);
    
    // Draw the text.
    draw_text(xx + sprite_get_width(spr_mask) + 20, yy_marco + 24, txt[i]);

    
    // Increase offset and height and restore xx coordinate.
    yy_marco += 95;
    height += 95;
}


// If the player hasn't claim his reward.
    /*if(ds_grid_get(grid, i, 1) == false){
    
        // Draw reward. (number).
        draw_text(xx, yy_marco, reward[i, 0]);
        
        // Select a sprite depending of the type of reward.
        //switch(reward[i, 1]){
        
      //  }
        
    // Draw the get reward button.
    }else if(amount == 100 and ds_grid_get(grid, i, 1) == false){
        draw_sprite(sprite3, 0, xx, yy_marco);
    }*/
