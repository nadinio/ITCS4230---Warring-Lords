instance_create(x+5, y, my_projectile);

with(my_projectile)
{
    image_angle = direction;
    move_towards_point(global.enemy.x, global.enemy.y, 15);
    if(instance_place(x, y, global.enemy))
    {
        global.damage_dealt = global.red_selected.attack;
        global.max_enemy_defence = global.enemy.max_health;
        
        global.enemy.defence -= global.damage_dealt;
        global.current_damage = global.enemy.defence;
        
        instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);
        if (global.enemy.defence <= 0) 
        {
            global.enemy.image_index = 0;
            global.enemy.sprite_index = global.enemy.death_anim;
        }
        
        global.attacking = false;
        global.red_selected.image_xscale = 1;
        global.enemy = noone;
        instance_destroy();
    }
}
