/// Delete_Info(txt)
var txt;
for(var i = 0; i < argument_count; i++){
    txt[i] = argument[i]; 
    if(file_exists(txt[i] + ".sav")){
        file_delete(txt[i] + ".sav");
    }
    if(file_exists(txt[i] + ".json")){
        file_delete(txt[i] + ".json");
    }
}
