
if(instance_number(my_projectile)== 0)
{
    audio_play_sound(attack_snd, 10, false);
    instance_create(x+5,y,my_projectile);
}
    
with (my_projectile)
{
    image_angle = direction;
    move_towards_point(global.enemy.x,global.enemy.y,15);
    if(instance_place(x,y,global.enemy))// if my_projectile and enemy hit each other
    {
        global.damage_dealt = global.selected.attack;//record amount of damage done this attack
        global.max_enemy_defence = global.enemy.max_health;//send enemy health
        
        global.enemy.defence -= global.damage_dealt;// set enemy current health
        global.current_damage = global.enemy.defence;// send enemy current health
        
        instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);//do damage to enemy
        // handle enemy deaths
        if (global.enemy.defence <= 0)
        {
            global.enemy.sprite_index = global.enemy.death_anim;
            global.enemy.image_speed = 0.5;
            audio_play_sound(global.enemy.death_snd, 10, false);
        }   
        global.attacking = false;
        global.enemy = noone;
        instance_destroy();
    }
}
