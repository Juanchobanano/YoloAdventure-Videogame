/// Set_Objectives(objetivo, cantidad, objeto, bool);
var objetivo = argument[0]; // ""
var cantidad = argument[1]; // 0 
var objeto = argument[2]; // noone
var bool = argument[3]; // If the objective is completed.

if(idioma == "en")
    txt1 = Traduce(
        "You completed#the level objective!", 
        "Catch the diamond!", 
        "Complete the level#without dying!", 
        "Commit suicide " + string(cantidad) + "#times with the Lava!", 
        "Complete the level#with " + string(cantidad) + " deaths!", 
        "Complete the level#with less than " + string(cantidad) + "#deaths!"
    );
else if(idioma == "es"){
    txt1 = Traduce(
        "Has completado el#objetivo del nivel!", 
        "Atrapa el diamante!", 
        "Completa el nivel#sin morir!", 
        "Suicidate con la#lava" + string(cantidad) + " veces!", 
        "Completa el nivel#con " + string(cantidad) + " muertes!", 
        "Completa el nivel#con menos de " + string(cantidad) + "#muertes!"
    );
}

// Draw the state of the objectives.
//draw_set_font(font_divaro_niveles19);
draw_set_font(font_rayman_niveles12);
draw_set_color(c_white);

var yy = 325;
if(bool){
    draw_text(x +64 +180 - string_width(txt1[0])/2, yy, txt1[0]); // 85
}else{
    // Draw objectives.
    switch(objetivo){
        case "objeto":
            draw_text(x +64 + 183 - string_width(txt1[1])/2, yy, txt1[1]); // 90
        break;
        case "nodeads":
            draw_text(x +64 + 180 - string_width(txt1[2])/2, yy, txt1[2]); // 97...
        break;
        case "matarse_con":
            draw_text(x +64 + 180 - string_width(txt1[3])/2, yy, txt1[3]);
        break;
        case "igual_muertes":
            draw_text(x + 64 +180 - string_width(txt1[4])/2, yy, txt1[4]);
        break;
        case "menos_muertes":            
            draw_text(x +64 + 125 - string_width(txt[5])/2, yy, txt1[5]);
        break;
    }
    
    // Draw the reward.
   // draw_set_color(c_white);
    //draw_text(x + 64 + 180, yy + 50, string(objective_reward) + 'x');
   // draw_sprite(spr_monedas, 0, x + 64 + 180 + string_width(string(objective_reward) + 'x') + 2, yy + 50);
    
    draw_set_color(c_yellow);
    draw_sprite(spr_monedas, 0, x + 70 + 180, yy + 48);
    draw_text(x+70+180+sprite_get_width(spr_monedas) + 2, yy + 50, 'x ' + string(objective_reward));
    
}
