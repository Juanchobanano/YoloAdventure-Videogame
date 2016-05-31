/// Compare_Times(time, lvl)
time = argument[0];
lvl = argument[1];

// Get the times.
var oro = ds_grid_get(tiempo_niveles, lvl, 0); // 10 
var plata = ds_grid_get(tiempo_niveles, lvl, 1); // 20


// Compare the times and return a medal.
if(time > 0 and time <= oro){
    return 3; // Oro
}else if(time > oro and time <= plata){
    return 2;
}else if(time > plata){
    return 1;
}
