// Left - Right - Up - Down (Corners).
if(x < -sprite_width){
    x = room_width;
}else if(x > room_width){
    x = -sprite_width;
}else if(y < -sprite_height){
    y = room_height;
}else if(y > room_height){
    y = -sprite_height;
}
