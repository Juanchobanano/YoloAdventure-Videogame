/* Destroy_Coins(lvl)
lvl = argument[0];

// Set local variables.
var str = "";
var count = 0;

// Load the x,y string.
var destroy = ds_list_find_value(destroy_coins, lvl);

    // If there is a space in the very first index of the string delete it.
    if(string_char_at(destroy, 1) == " "){
        string_delete(destroy, 1, 1);
    }

// Devide the x, y positions.
for(i = 1; i < string_length(destroy); i++){

    // Check to see if there are not black spaces.
    while(string_char_at(destroy, i) != ' '){
        str = string_copy(destroy, 1, i); 
    }
    
    // Destroy the selected str with the next blanck space.
    string_delete(destroy, 1, i);
    
    // Call the Fill_DestroyList Script.
    Fill_DestroyList(str);
    
    // Reset str string.
    str = "";
}
