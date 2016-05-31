/// Check_Objetives(objetivo, cantidad, objeto)
var nivel = argument[0]; 
alreadycompleted = ds_grid_get(level_object, nivel, 1);

// If the player already completed the objective.
if(!alreadycompleted){
    var completed = false;
    switch(objetivo){
        case "objeto":
            if(!instance_exists(Objeto)){
                completed = true;
            }
        break;
        case "nodeads":
            if(muertes == 0){
                completed = true;
            }   
        break;
        case "matarse_con":
            
    
        break;
        case "igual_muertes":
            if(muertes == cantidad){
                completed = true;
            }   
            
        break;
        case "menos_muertes":
            if(muertes < cantidad){
                completed = true;
            }   
        
        break;
    }
    
    // If the player completed the objective of the lvl.
    if(completed){
        ds_grid_set(level_object, nivel, 1, true);
        /// Save the objective list.
        var grid1 = ds_grid_create(1,2);
        ds_grid_add(grid1, 0, 0, "key_objective");
        ds_grid_add(grid1, 0, 1,  level_object);
        Save_Data("Objectives", grid1, "grid", true);
        return true;
    }
}
return false;
