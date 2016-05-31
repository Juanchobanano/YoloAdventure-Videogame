/* Take_Coin(coin_x, coin_y, lvl)











// Save the Coin.
coin_pos = string(argument[0]) + ',' + string(argument[1]);
var str = ds_list_find_value(destroy_coins, lvl);
str += ' ' + coin_pos;
ds_list_replace(destroy_coins, lvl, str)
