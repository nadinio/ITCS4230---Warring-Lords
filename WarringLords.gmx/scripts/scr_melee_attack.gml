global.damage_dealt = attack;//amount of damage done this attack
global.max_enemy_defence = global.enemy.max_health;

global.enemy.defence -= global.damage_dealt;
global.current_damage = global.enemy.defence;

instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);

// handle enemy deaths

if (global.enemy.defence <= 0) 
    {
        global.enemy.sprite_index = global.enemy.death_anim;
        global.enemy.image_index = 0;
        global.enemy.image_speed = 0.5;
    }

global.attacking = false;
global.enemy = noone;
