/// Contact(obj, hsp, vsp)
obj = argument[0];
hsp = argument[1];
vsp = argument[2];

// Horizontal Collision.
if (place_meeting(x+hsp, y, obj)){
    while(!place_meeting(x + sign(hsp), y, obj)){
        x += sign(hsp);
    }
    hsp = 0;
}

// Vertical Collision.
if (place_meeting(x, y+vsp, obj)){
    while(!place_meeting(x, y + sign(vsp), obj)){
        y += sign(vsp);
    }
    vsp = 0;
}

// Apply x and y hsp and vsp.
x += hsp;
y += vsp;
