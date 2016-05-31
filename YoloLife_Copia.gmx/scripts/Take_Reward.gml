// Take_Reward(reward_amount, font)
reward_amount = argument[0];

global_monedas += reward_amount;

inst = instance_create(151 + sprite_get_width(spr_box_achievement), yy_marco + sprite_get_height(spr_box_achievement)/2, rewardObject);

switch(reward_amount){
    case 30:
        with(inst){
            reward_amount = 30;
        }
    break;
    case 50:
        with(inst){
            reward_amount = 50;
        }
    break;
    case 100:
        with(inst){
            reward_amount = 100;
        }
    break;
}
//Save_Data(logros, "logros", "grid", "gedkgn239fe");
