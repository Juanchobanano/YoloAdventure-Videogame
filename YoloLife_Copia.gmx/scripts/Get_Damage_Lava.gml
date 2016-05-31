/// Get_Damage()
if(position_meeting(x + 12, y + 24, Wall)){
    vsp = -jumpspeed;
    hsp = 0;
}

// Apply Gravity.
if(vsp < 10){
    vsp += grav;    
}

// Contact Wall.
Contact(Wall, hsp, vsp);
