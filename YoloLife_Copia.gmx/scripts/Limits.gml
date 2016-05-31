// Limits();
if(x < 0){
    x = 0;
}else if(x > room_width - sprite_width){
    x = room_width - sprite_width;
}else if(y < 0){
    y = 0;
}else if(y > room_height - sprite_height){
    y = room_height - sprite_height;
}
