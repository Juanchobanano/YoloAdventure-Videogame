// Fill_Objetives()

// Nada: -1, Int: Muertes, String-Clave: Objeto, String: Otro Objectivo

//                                  Map_Objective(name, reward, cantidad, object);
ds_grid_add(level_object, 0, 0,     Map_Objectives("noone")); // Level 1.
ds_grid_add(level_object, 1, 0,     Map_Objectives("noone")); // Level 2.
ds_grid_add(level_object, 2, 0,     Map_Objectives("noone")); // Level 3.
ds_grid_add(level_object, 3, 0,     Map_Objectives("menos_muertes", 10, 5)); // Level 4.
ds_grid_add(level_object, 4, 0,     Map_Objectives("noone")); // Level 5.
ds_grid_add(level_object, 5, 0,     Map_Objectives("noone")); // Level 6.
ds_grid_add(level_object, 6, 0,     Map_Objectives("menos_muertes", 20, 10)); // Level 7.
ds_grid_add(level_object, 7, 0,     Map_Objectives("noone")); // Level 8.+
ds_grid_add(level_object, 8, 0,     Map_Objectives("nodeads", 30)); // Level 9.
ds_grid_add(level_object, 9, 0,     Map_Objectives("noone")); // Level 10.

ds_grid_add(level_object, 10, 0,    Map_Objectives("noone")); // Level 11.
ds_grid_add(level_object, 11, 0,    Map_Objectives("noone")); // Level 12.
ds_grid_add(level_object, 12, 0,    Map_Objectives("objeto", 40)); // Level 13
ds_grid_add(level_object, 13, 0,    Map_Objectives("noone")); // Level 14.
ds_grid_add(level_object, 14, 0,    Map_Objectives("noone")); // Level 15.
ds_grid_add(level_object, 15, 0,    Map_Objectives("igual_muertes", 50, 10)); // Level 16.
ds_grid_add(level_object, 16, 0,    Map_Objectives("noone")); // Level 17.
ds_grid_add(level_object, 17, 0,    Map_Objectives("nodeads", 60)); // Level 18.
ds_grid_add(level_object, 18, 0,    Map_Objectives("noone")); // Level 19.
ds_grid_add(level_object, 19, 0,    Map_Objectives("objeto", 60)); // Level 20.


// objeto, nodeads, igual_muertes, menos_muertes


// For loop false everything.
for(var i = 0; i < show_levels - 1; i++){
    var object = ds_map_find_value(ds_grid_get(level_object, i, 0), 'name'); 
    ds_grid_add(level_object, i, 1, false);
    if(object == "noone"){
        ds_grid_set(level_object, i, 1, true);
    }
}

show_debug_message('true or false lvl 4 ' + string(ds_grid_get(level_object, 3, 1)));
