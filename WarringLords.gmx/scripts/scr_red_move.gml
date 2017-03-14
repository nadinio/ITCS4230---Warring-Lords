/*
    this script needs to allow the player to click on and move there assets.
    just handle the move squares only this is achieved by using obj_move_square rather than the one built for red team
    
    display the end turn button, and handle its function (just make it an object)
*/
if (instance_position(mouse_x,mouse_y,par_red) && mouse_check_button_pressed(mb_left))//if you click on an object that is a par_red object / or its child
{
    if (global.moving == false && global.attacking == false)//if you haven't moved or attacked
    {
        var player;
        player = instance_nearest(mouse_x,mouse_y,par_red);
        
        global.red_selected = player;
        
        with(obj_move_square) {instance_destroy();}
        with (obj_attack_square){instance_destroy();}
        
        if (player.type ==2)//if the attack type is ranged
        {
            if (player.attacked == false)
            {
                with (par_blue)
                {
                    if (distance_to_object(global.red_selected) <= 130) {instance_create(x,y,obj_attack_square);}//we place an attack square at a distances
                }
            }
        }       
        scr_red_place_move_squares();
    }
}
else if (!instance_position(mouse_x,mouse_y,par_red)&& mouse_check_button_pressed(mb_left))// if the object isnt from the par_red
{
    if (global.moving == false && global.attacking == false)//and were not moving or attacking
    {
        global.red_selected = noone;//we have selected no one / get rid of the stuff
        with (obj_move_square) {instance_destroy();}
        with (obj_attack_square) {instance_destroy();}
    }
}



if (global.red_selected != noone && mouse_check_button_pressed(mb_right))//if no one is selected and we right click
{
    if (instance_position(mouse_x,mouse_y,obj_move_square))// if we clicked a move square
    {
        global.moving = true;    
        with (obj_move_square){instance_destroy();}//get rid of the move squares after they have been used
        with (obj_attack_square){instance_destroy();}
        with (global.red_selected)
        {
            
            scr_navigation(x,y,round(mouse_x/32)*32,round(mouse_y/32)*32,pace);
            pixel_dist -= path_get_length(global.navigate); // get the pixel lenght traveled - use up move points
        }
    }
    else if (instance_position(mouse_x,mouse_y,obj_attack_square))//if we right clicked an attack square
    {
        global.enemy = instance_position(mouse_x,mouse_y,par_blue);//set the global enemy variable to what we clicked
        global.attacking = true;
        with (global.red_selected) 
        {
            attacked = true;
            if (type == 1)//if melee attack
            {
                if (distance_to_object(global.enemy)>13)
                {
                    global.moving =true;
                    scr_calculate_dist();
                    
                    scr_navigation(x,y,round(global.attack_travel_x/32)*32,round(global.attack_travel_y/32)*32,pace);
                    pixel_dist -= path_get_length(global.navigate);
                }
            }
            else if (type == 2)// this would be used if we had complex animation but o well
            {
                if (global.enemy.x < x-5) {image_xscale = -1;}// used to invert the attacker 
            }
        }
        with (obj_move_square){instance_destroy();}
        with (obj_attack_square){instance_destroy();}
    }
}

// used to set to the objects current node/ move the asset
if (global.moving == true)
{
    with (global.red_selected)
    {
        if (path_index == -1)
        {
            cur_node_x = x;
            cur_node_y = y;
            global.moving = false;
        }
    }
}
// setting and using the attack scripts
if (global.attacking == true)
{
    if (global.moving == false)//can't attack and move at the same time
    {
        with (global.red_selected) 
        {
            if(type==1){scr_melee_attack();}
            else if (type==2) {scr_red_ranged_attack();}
            attacked=true;
        }
    }
}
