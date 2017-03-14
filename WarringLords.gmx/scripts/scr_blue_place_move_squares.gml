// This is used to create collisons 
mp_grid_clear_rectangle(global.map_grid, 0, 0, 640, 360);
with (par_blue)
{
    if (self.id != global.selected.id)  
<<<<<<< HEAD
    {
        //mp_grid_add_cell(global.map_grid, round(x/32)-2, round(y/32)-4); // another version of the same thing 
        mp_grid_add_rectangle(global.map_grid, x, y, x, y)
    }
}
=======
    //mp_grid_add_cell(global.map_grid, round(x/32)-2, round(y/32)-4); // another version of the same thing    
    {mp_grid_add_rectangle(global.map_grid, x, y, x, y)}
   
}

>>>>>>> final
with (par_red)
{
    mp_grid_add_rectangle(global.map_grid, x, y, x, y)
}
<<<<<<< HEAD
=======

>>>>>>> final
// Check entire grid to see where we can move
for (i=0; i<18; i+=1;)
{
    var i_x;
    i_x = 64+32*i;

    if (mp_grid_path(global.map_grid, global.navigate, global.selected.cur_node_x, global.selected.cur_node_y, i_x, row, 1))
    {
<<<<<<< HEAD
        if (path_get_length(global.navigate) <= global.selected.pixel_dist)//if the space is in range
        {instance_create(i_x,row,obj_blue_move_square);}//put a move square there
        else //turn all points out of reach off maybe remove later
        {mp_grid_add_rectangle(global.map_grid, i_x, row, i_x, row);}
    }
    else 
    {mp_grid_add_rectangle(global.map_grid, i_x, row, i_x, row);}
=======
        if (path_get_length(global.navigate) <= global.selected.pixel_dist)//if this square is in range 
        {instance_create(i_x,row,obj_blue_move_square);}//make a move_square - whitch in turn would place an attack square       
        /*
        else //turn all points out of reach off maybe remove later
        {mp_grid_add_rectangle(global.map_grid, i_x, row, i_x, row);}*/
    }
    /*
    else 
    {mp_grid_add_rectangle(global.map_grid, i_x, row, i_x, row);}*/
>>>>>>> final
    
    if (i_x >= 576) // 576 is last row (18 rows * 32 pixels high)
    {
        i = -1;
        row += 32;
    }
    
    if (row > 600)
    {
        row = 128;
        i = 20;
        return false;
    }
}
