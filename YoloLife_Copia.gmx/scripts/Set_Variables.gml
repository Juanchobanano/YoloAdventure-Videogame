/// Set player's local variables.
gem = argument[0];

// Normal variables.
jumpspeed = 8;
movespeed = 4;
grav = .5;

coins = 1;
attract = false;

// Apply new physics or settings.
switch(gem){
    case 1: // Decrease the gravity and the jumpspeed.
        grav = .1;
        jumpspeed = 4;
    break;
    case 2: // Increase the JumpSpeed.
        jumpspeed = 8;
    break;
    case 3: // Coins x 2
        coins = 2;
        with(Moneda){ sprite_index = spr_monedas_azules; }
    break;
    case 4: // Atraer monedas.
        attract = true;
    break;
    case 5: // Increase the movespeed.
        movespeed = 6;
    break;
    case 6:
        
    break;
}
