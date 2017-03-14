/*Melee attack*/
global.damage_dealt = attack;//record amount of damage done this attack
global.max_enemy_defence = global.enemy.max_health;//send enemy health

global.enemy.defence -= global.damage_dealt;// set enemy current health
global.current_damage = global.enemy.defence;// send enemy current health

instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);//do damage to enemy

// handle enemy deaths
if (global.enemy.defence <= 0) 
    {
        global.enemy.sprite_index = global.enemy.death_anim;
        global.enemy.image_index = 0;
        global.enemy.image_speed = 0.5;
    }

global.attacking = false;
global.enemy = noone;
