/// Get_Achievement_Progress(nombre_del_logro_cuyo_progreso_quieren_copiar)
var name_a = argument[0];


txt = Traduce(
    "Visit our facebook fanpage!", 
    "Invite 5 friends to play with#you!", 
    "Complete 5 objectives!", 
    "Get the gold trophy in 5#different levels!", 
    "You have played Yolo Life 25#times!",
    "Complete 25 levels of the#world!", 
    "Pick up 50 gold bars!", 
    "You have used 25 times the#slowdown power!", 
    "You have used 15 times the#freeze power!", 
    "You have used 15 times the#checkpoint power!", 
    "Get kill with the lava 50#times!"
);

var pos = -1;
for(var i = 0; i < array_length_1d(txt); i++){
    if(name_a == txt[i]){
        return (ds_grid_get(logros, i, 0));
        exit;
    }
}

return "";
