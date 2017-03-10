if(instance_number(par_player) < 1)
    global.state = states.fail_state;

if (global.ai_selected == noone)
    if (global.ai_activated == false)
    {
        ai_active = instance_number(par_enemy) - global.ai_id;
        global.ai_selected = instance_find(par_enemy, ai_active);
        
        scr_place_move_squares_ai();
        global.ai_activated = true;
    }

    
// Make AI decisions
with (global.ai_selected)
{
    if(global.ai_activated == true)
    {
        nearest_target = instance_nearest(x, y, par_player);
        nearest_move = instance_nearest(nearest_target.x, nearest_target.y, obj_move_square_ai);
        nearest_attack = instance_nearest(x, y, obj_attack_square_ai);
        
        // Mele player actions
        if (type == 1)
        {
            if(moved == false)
                scr_navigation(x, y, round(nearest_move.x/32)*32, round(nearest_move.y/32)*32);
            if(path_index == -1)
            {
                        
                moved = true;
                
                if(instance_exists(obj_attack_square_ai))
                    global.enemy = instance_position(nearest_attack.x, nearest_attack.y, par_player);   
                    
                if (global.enemy != noone)
                    scr_mele_attack_ai();
                else
                    attacked = true;                                                    
                    
                with(obj_move_square_ai)
                    instance_destroy();
                    
                curr_node_x = round(x/32)*32;
                curr_node_y = round(y/32)*32;
                
                if(attacked == true && moved == true)
                {
                    global.enemy = noone;
                    global.ai_id += 1;
                    global.ai_selected = noone;
                    global.ai_activated = false;
                }
            }
        }
        
        // Ranged player actions
        if(type == 2)
        {
            if (acquired_targets == false)
            {  
                with(par_player)
                    if (distance_to_object(global.ai_selected) <= 130)
                        instance_create(x, y, obj_attack_square_ai);
                        
                nearest_attack = instance_nearest(x, y, obj_attack_square_ai);
                acquired_targets = true;
                        
            }
            if (instance_exists(obj_attack_square_ai))
            {
                global.enemy = instance_position(nearest_attack.x, nearest_attack.y, par_player)
                moved = true;
                scr_ranged_attack_ai();
            } 
            if(!instance_exists (obj_attack_square_ai))
            {
                attacked = true;
                if (moved == false)
                    scr_navigation(x, y, round(nearest_move.x/32)*32, round(nearest_move.y/32)*32);
         
            }
        }
        
        if(path_index == -1)
        {        
            moved = true;
            cur_node_x = round(x/32)*32;
            cur_node_y = round(y/32)*32;
            with(obj_move_square_ai)
                instance_destroy();   
            if(attacked == true && moved == true)
            {
                    global.enemy = noone;
                    global.ai_id += 1;
                    global.ai_selected = noone;
                    global.ai_activated = false;
            } 
        }                    
     }
}

if (global.ai_id > instance_number(par_enemy))
{
    global.state = states.red_turn;
    global.ai_selected = noone;
    global.enemy = noone;
    global.ai_id = 1;
    with (par_enemy)
    {
        attacked = false;
        moved = false;
        acquired_targets = false;
    }
}
