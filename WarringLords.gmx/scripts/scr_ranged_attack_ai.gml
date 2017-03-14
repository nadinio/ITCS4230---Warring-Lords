instance_create(x+5, y-10, my_projectile);

with(my_projectile)
{
    image_angle = direction;
    move_towards_point(global.enemy.x, global.enemy.y-10, 15);
    
    if(instance_place(x, y, global.enemy))
    {
        global.damage_dealt = irandom(global.ai_selected.attack);
        global.enemy.defence -= global.damage_dealt;
        
        instance_create(global.enemy.x, global.enemy.y, obj_damage_dealt);
        instance_destroy();
        
        global.attacking = false;
        
    
        with(obj_attack_square_ai)
            instance_destroy();
        global.enemy = noone;
        attacked = true;
        if(instance_number(par_player) < 1)
            global.state = states.fail_state;
            
     }   
}
