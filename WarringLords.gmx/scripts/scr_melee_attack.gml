/*Melee attack*/
global.damage_dealt = attack;//record amount of damage done this attack
global.max_enemy_defence = global.enemy.max_health;//send enemy health

global.enemy.defence -= global.damage_dealt;// set enemy current health
global.current_damage = global.enemy.defence;// send enemy current health

audio_play_sound(attack_snd, 10, false);
instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);//do damage to enemy

// handle enemy deaths
if (global.enemy.defence <= 0) 
    {
        global.enemy.sprite_index = global.enemy.death_anim;
        global.enemy.image_index = 0;
        global.enemy.image_speed = 0.5;
        audio_play_sound(global.enemy.death_snd, 10, false);
    }

global.attacking = false;
global.enemy = noone;
