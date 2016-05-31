/// Increase_Amount(num_achievemnt, amount);
var name_a = argument[0];
var amount = argument[1];

txt = Traduce(
        "Visit our facebook fanpage!", 
        "Invite 5 friends to play with#you!", 
        "Complete 5 objectives!", 
        "Get the gold trophy in 15#different levels!", 
        "You have played Yolo Life 50#times!",
        "Complete 30 levels of the#world!", 
        "Pick up 1000 gold bars!", 
        "You have used 25 times the#slowdown power!", 
        "You have used 15 times the#freeze power!", 
        "You have used 15 times the#checkpoint power!", 
        "Get kill with the enemies 500#times!", 
);

achievement_id = Traduce(
        "CgkIn7v1l5McEAIQHw",
        "CgkIn7v1l5McEAIQIA",
        "CgkIn7v1l5McEAIQIQ",
        "CgkIn7v1l5McEAIQIg",
        "CgkIn7v1l5McEAIQIw",
        "CgkIn7v1l5McEAIQJA",
        "CgkIn7v1l5McEAIQJQ",
        "CgkIn7v1l5McEAIQJg",
        "CgkIn7v1l5McEAIQJw",
        "CgkIn7v1l5McEAIQKA",
        "CgkIn7v1l5McEAIQKQ"
);

var pos = 0;
for(var i = 0; i < array_length_1d(txt); i++){
    if(name_a == txt[i]){
        pos = i;
        break;
    }
}

// Increase local Achievement.
var pre_amount = ds_grid_get(logros, pos, 0);
var new_amount = pre_amount + amount;
ds_grid_set(logros, pos, 0, new_amount);

// If finished, complete the achievement!
if(achievement_login_status()){
    if(ds_grid_get(logros, pos, 0) >= ds_grid_get(logros, pos, 1)){
       achievement_post(achievement_id[pos], 100);
    }
}

// Create key array.
var grid1 = ds_grid_create(1,2);
ds_grid_add(grid1, 0, 0, "key_logros");
ds_grid_add(grid1, 0, 1, logros);
Save_Data("Logros", grid1, "grid", true);
