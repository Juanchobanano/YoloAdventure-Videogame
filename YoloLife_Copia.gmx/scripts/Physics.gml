// Physics()

//var grounded = position_meeting(Per.x, Per.y + 24, Wall); 

if(key_jump){
    vsp = key_jump * -jumpspeed;
    
    // Create particle.
    instance_create(x + 8, y + 24, Jump_Particles);
        
    // Set the variables to their normal state.
    key_jump = 0;
    with(Key_Jump){ image_index = 0; }
    
}else{
    // Apply Gravity.
    if(vsp < 10){
        vsp += grav;    
    }
}

// Move Speed.
move = key_right + key_left;
hsp = move * movespeed;

// Contact wall.
Contact(Wall, hsp, vsp);
