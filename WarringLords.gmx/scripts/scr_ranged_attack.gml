instance_create(x+5, y, my_projectile);

with(my_projectile)
{
    image_angle = direction;
    move_towards_point(global.enemy.x, global.enemy.y, 15);
    
    if(instance_place(x, y, global.enemy))
    {
        global.damage_dealt = irandom(global.selected.attack);
        global.enemy.defence -= global.damage_dealt;
        
        instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);
        instance_destroy();
        
        global.attacking = false;
        global.selected.image_xscale = 1;
        
    }
}
