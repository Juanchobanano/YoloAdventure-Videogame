/// Get_Price(string_price);
var string_price = argument[0];

var sprite = spr_monedas;
var color = c_yellow;

for(var i = 1; i <= string_width(string_price); i++){
    if(string_char_at(string_price, i) != "g" or string_char_at(string_price, i) != "c"){
        var price = string_copy(string_price, 1, i);
    }else{
        var type_price = string_copy(string_price, i, i);
        
        if(type_price == "g" or type_price == 'g'){
            var sprite = spr_monedas;
            var color = c_yellow;
        }else if(type_price == "c"){
           // var sprite = spr_cristals;
            var color = c_purple;

        }
        break;
    }

}

var list = ds_list_create();
ds_list_add(list, int64(price));
//ds_list_add(list, type_price);
ds_list_add(list, sprite);
ds_list_add(list, color);
return list;
