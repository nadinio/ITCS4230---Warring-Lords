show_message("I AM IN THE ATTACKING SCRIPT!");

global.damage_dealt = irandom(attack);
global.enemy.defence -= global.damage_dealt;
instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);

with(obj_attack_square_ai)
    instance_destroy();

global.enemy = noone;
attacked = true;

if(instance_number(par_player < 1))  
    global.state = states.fail_state;

