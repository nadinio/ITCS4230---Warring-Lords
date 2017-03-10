if (instance_position(mouse_x, mouse_y, par_player) && mouse_check_button_pressed(mb_left)) // If you click on an asset
{
    if (global.moving == false && global.attacking == false)
    {
        // When mouse clicks asset, select that asset
        var player;
        player = instance_nearest(mouse_x, mouse_y, par_player);
        global.selected = player;
        
        with (obj_move_square) {instance_destroy();}
        with (obj_attack_square) {instance_destroy();}
    
        // Creates attack square if a ranged player is in range.
        if(player.type == 2)
            if(player.attacked == false)
                with(par_enemy)
                    if(distance_to_object(global.selected) <= 130)
                        instance_create(x, y, obj_attack_square);
            
        
        scr_place_move_squares();
    }
}


// Move to only move squares
if (global.selected != noone && mouse_check_button_pressed(mb_right))
{
    if(instance_position(mouse_x, mouse_y, obj_move_square))
    {
        global.moving = true; 
        with (obj_attack_square) {instance_destroy();}   
        with (obj_move_square){instance_destroy();} // Get rid of the move squares affter they have been used
        
        with (global.selected)
        {
            scr_navigation(x ,y, round(mouse_x/32)*32, round(mouse_y/32)*32);
            pixel_dist -= path_get_length(global.navigate); // get the pixel lenght traveled - use up move points
        }
    }
    // Attack Enemy
    if(instance_position(mouse_x, mouse_y, obj_attack_square))
    {
        global.enemy = instance_position(mouse_x, mouse_y, par_enemy);
        global.attacking = true;
        with(global.selected)
        {
            attacked = true; // Will set the player attack variables to true. 1 attack per turn.
            
            // Mele attack
            if(type == 1)
                if (distance_to_object(obj_attack_square) > 13)
                {
                    global.moving = true;
                    scr_calculate_dist();
                    scr_navigation(x, y, round(global.attack_travel_x/32)*32, round(global.attack_travel_y/32)*32);
                    pixel_dist -= path_get_length(global.navigate);
                }
            // Ranged attack
            //if(type == 2)
                // Stuff?
        }
        with (obj_move_square) {instance_destroy();}
        with (obj_attack_square) {instance_destroy();}
    }
}

// used to set to the objects current node
if (global.moving == true)
{
    with (global.selected)
    {
        if (path_index == -1)
        {
            cur_node_x = x;
            cur_node_y = y;
            global.moving = false;
        }
    }
}

// Execute attack scripts
if(global.attacking == true)
    if(global.moving == false)
        with(global.selected)
        { 
            if(type == 1)
                scr_mele_attack();
                
            if(type == 2)
                scr_ranged_attack();
           
            attacked = true;              
        }
        
        
            
        
    

