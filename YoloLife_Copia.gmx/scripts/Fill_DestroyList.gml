/* Fill_DestroyList(string)
text = argument[0];

// Set local variables.
var str2 = "";
var xx = 0;
var yy = 0;
var count = 0;

// Retrieve (int) the x and y coordinate.
for(i = 1; i < string_length(str2); i++){

    // Check to see if there are not comas.
    while(string_char_at(text, i) != ','){
        str2 = string_copy(text, 1, i); 
        count++;
    }
    
    // Delete the selected string.
    string_delete(text, 1, i);
    
    // Whether if it is x or y coordinate.
    switch(count){
        case 1:
            xx = int64(str2);
            str = "";
        break;
        case 2:
            yy = int64(str2);
            str = "";
            break;
        break;
    
    }
}

// Destroy the coin.
var inst = instance_nearest(xx, yy, Coin);
if(instance_exists(inst)){
    with(inst){
        instance_destroy();
    }
}
