/*
    move and attack with one unit 
    modified    
    par_player => par_red
    par_enemy => par_blue
    obj_move_square => obj_red_move_square
    scr_calculate_dist => scr_red_calculate_dist
*/
<<<<<<< HEAD
if (instance_position(mouse_x,mouse_y,par_red) && mouse_check_button_pressed(mb_left))//if you click on an object that is a par_red object / or its child
=======
var end_turn =0;
if (instance_position(mouse_x,mouse_y,par_red) && mouse_check_button_pressed(mb_left))
>>>>>>> final
{
    if (global.moving == false && global.attacking == false)//if you haven't moved or attacked
    {
        var player;
        player = instance_nearest(mouse_x,mouse_y,par_red);
        
        global.selected = player;
        
        with(obj_red_move_square) {instance_destroy();}
        with (obj_attack_square){instance_destroy();}
<<<<<<< HEAD
        
        if (player.type ==2)//if the attack type is ranged
        {
            if (player.attacked == false)
            {
                with (par_blue)
                {
                    if (distance_to_object(global.selected) <= 130) {instance_create(x,y,obj_attack_square);}//we place an attack square at a distances
                }
            }
        }       
        scr_red_place_move_squares();
=======
        if (player.type ==2)// if we attack from range
        {
            if (player.attacked == false)
            {
                with (par_blue)//set attack squares on all enemies in range
                {
                    if (distance_to_object(global.selected) <= 130) {instance_create(x,y,obj_attack_square);}
                }
            }
        }
        scr_red_place_move_squares();
    }
}
else if (!instance_position(mouse_x,mouse_y,par_red)&& mouse_check_button_pressed(mb_left))// cancle order
{
    if (global.moving == false && global.attacking == false)
    {
        global.selected = noone;
        with (obj_red_move_square) {instance_destroy();}
        with (obj_attack_square) {instance_destroy();}
>>>>>>> final
    }
}
else if (!instance_position(mouse_x,mouse_y,par_red)&& mouse_check_button_pressed(mb_left))// if the object isnt from the par_red
{
    if (global.moving == false && global.attacking == false)//and were not moving or attacking
    {
        global.selected = noone;//we have selected no one / get rid of the stuff
        with (obj_red_move_square) {instance_destroy();}
        with (obj_attack_square) {instance_destroy();}
    }
}



<<<<<<< HEAD
if (global.selected != noone && mouse_check_button_pressed(mb_right))//if no one is selected and we right click
{
    if (instance_position(mouse_x,mouse_y,obj_red_move_square))// if we clicked a move square
    {
        global.moving = true;    
        with (obj_red_move_square){instance_destroy();}//get rid of the move squares after they have been used
        with (obj_attack_square){instance_destroy();}
        with (global.selected)
        {
            
=======

if (global.selected != noone && mouse_check_button_pressed(mb_right))//if you right click on not no one
{
    if (instance_position(mouse_x,mouse_y,obj_red_move_square))
    {
        global.moving = true;    
        with (obj_red_move_square){instance_destroy();}//get rid of the move squares affter they have been used
        with (obj_attack_square){instance_destroy();}
        with (global.selected)
        {
>>>>>>> final
            scr_navigation(x,y,round(mouse_x/32)*32,round(mouse_y/32)*32,pace);
            pixel_dist -= path_get_length(global.navigate); // get the pixel lenght traveled - use up move points
            end_turn +=1;
        }
    }
<<<<<<< HEAD
    else if (instance_position(mouse_x,mouse_y,obj_attack_square))//if we right clicked an attack square
    {
        global.enemy = instance_position(mouse_x,mouse_y,par_blue);//set the global enemy variable to what we clicked
=======
    else if (instance_position(mouse_x,mouse_y,obj_attack_square))//if we click attack square
    {
        global.enemy = instance_position(mouse_x,mouse_y,par_blue);
>>>>>>> final
        global.attacking = true;
        with (global.selected) 
        {
            attacked = true;
<<<<<<< HEAD
            if (type == 1)//if melee attack
            {
                if (distance_to_object(global.enemy)>13)
                {
                    global.moving =true;
                    scr_calculate_dist();
                    
=======
            if (type == 1)
            {
                if (distance_to_object(global.enemy)>13)//should go to the closete square
                {
                    global.moving =true;
                    scr_red_calculate_dist();
                    /*show_message//bug hunt code
                    (
                        "attack_travel_x: "+string(global.attack_travel_x)+
                        "#attack_travel_y: "+string(global.attack_travel_y)+
                        "#round(global.attack_travel_x/32)*32: "+string(round(global.attack_travel_x/32)*32)+
                        "#round(global.attack_travel_y/32)*32 :"+string(round(global.attack_travel_y/32)*32)
                    );*/
>>>>>>> final
                    scr_navigation(x,y,round(global.attack_travel_x/32)*32,round(global.attack_travel_y/32)*32,pace);
                    pixel_dist -= path_get_length(global.navigate);
                }
            }
<<<<<<< HEAD
            else if (type == 2)// this would be used if we had complex animation but o well
            {
                if (global.enemy.x < x-5) {image_xscale = -1;}// used to invert the attacker 
=======
            else if (type == 2)//if we attack at range then we dont need to move
            {
                //incase we need to do somthing i didnt want to lose my place
>>>>>>> final
            }
        }
        with (obj_red_move_square){instance_destroy();}
        with (obj_attack_square){instance_destroy();}
<<<<<<< HEAD
=======
        end_turn +=1;
>>>>>>> final
    }
}

// used to set to the objects current node/ move the asset
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
<<<<<<< HEAD
// setting and using the attack scripts
if (global.attacking == true)
{
    if (global.moving == false)//can't attack and move at the same time
    {
=======

if (global.attacking == true)
{
    if (global.moving == false)
    {
        /*show_message//bug hunt code
        (
            "#global.enemy: "+string(global.enemy)+
            "#global.enemy.x: "+string(global.enemy.x)+
            "#global.enemy.y: "+string(global.enemy.y)   
        );*/
>>>>>>> final
        with (global.selected) 
        {
            if(type==1){scr_melee_attack();}
            else if (type==2) {scr_ranged_attack();}
            attacked=true;
<<<<<<< HEAD
        }
    }
}
=======
        }
    }
}

// end turn after one move 
if (end_turn >0)
{
    if(instance_number(obj_blue_capital)> 0)
    {
        global.state = states.blue_turn;
        obj_red_capital.gold += obj_red_capital.diplomacy;
        with (par_red)
        {
            /*reset the move and attack variables for the red player after his turn ends*/
            pixel_dist = orig_pixel_dist;
            attacked = false;
        }
    }
    end_turn =0;
}



>>>>>>> final
