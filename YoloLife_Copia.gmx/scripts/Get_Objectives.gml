/// Get_Objectives(map)

// Give a value to this variables if exists.
objective_reward = ds_map_find_value(map, 'reward');
objetivo = ds_map_find_value(map, 'name');


// We do no't need to define more variables.
if(objetivo == "nodeads" or objetivo == "objeto" or objetivo == "noone"){
    exit; 

// We have to define 2 variables.
}else if(objetivo == "igual_muertes" or objetivo == "menos_muertes"){
    cantidad = ds_map_find_value(map, "cantidad");
    exit;
    
// We have to define 3 variables.
}else if(objetivo == "matarse_con"){
    cantidad = ds_map_find_value(map, "cantidad");
    objeto = ds_map_find_value(map, "objeto");
    exit;
}
// 1: no_deads, objeto: no necesita definir más variables.
// 2: igual_muertes, menos_muertes
// 3: matarse_con
