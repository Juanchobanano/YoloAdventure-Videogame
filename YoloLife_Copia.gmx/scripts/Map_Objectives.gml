/// Map_Objectives(name, reward, cantidad, object);
var map = ds_map_create();
ds_map_add(map, 'name', argument[0]);

if(argument_count > 1){
    ds_map_add(map, 'reward', argument[1]);
}

if(argument_count > 2){
    ds_map_add(map, 'cantidad', argument[2]);
}

if(argument_count > 3){
    ds_map_add(map, 'objeto', argument[3]);
}
return map;
