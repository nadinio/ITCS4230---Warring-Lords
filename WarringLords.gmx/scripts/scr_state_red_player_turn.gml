if (instance_position(mouse_x,mouse_y,par_player) && mouse_check_button_pressed(mb_left))
{
    var player;
    player = instance_nearest(mouse_x,mouse_y,par_player);
    
    global.selected = player;
    
    if(instance_exists(obj_move_square))// for preventing over lapping move squares when selecting between multiply assets
    {
        with(obj_move_square) {instance_destroy();}
    }
    
    scr_place_move_squares();
}

if (global.selected != noone && mouse_check_button_pressed(mb_right) && instance_position(mouse_x,mouse_y,obj_move_square))
{
    global.moving = true;    

    with (obj_move_square){instance_destroy();}//get rid of the move squares affter they have been used
    
    with (global.selected)
    {
        scr_navigation(x,y,round(mouse_x/32)*32,round(mouse_y/32)*32);
        pixel_dist -= path_get_length(global.navigate); // get the pixel lenght traveled - use up move points
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
