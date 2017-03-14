// This is used to create collisons 
mp_grid_clear_rectangle(global.map_grid, 0, 0, 640, 360);
with (par_enemy)
    if (self.id != global.ai_selected.id)  
        mp_grid_add_rectangle(global.map_grid, x, y, x, y)
    

with (par_player)
        mp_grid_add_rectangle(global.map_grid, x, y, x, y)
    

// Check entire grid to see where we can move
for (i=0; i<18; i+=1;)
{
    var i_x;
    i_x = 64+32*i;

    if (mp_grid_path(global.map_grid, global.navigate, global.ai_selected.cur_node_x, global.ai_selected.cur_node_y, i_x, row, 1))
    {
        if (path_get_length(global.navigate) <= global.ai_selected.pixel_dist)
        {
            instance_create(i_x,row,obj_move_square_ai);
        }
        
        else //turn all points out of reach off maybe remove later
        {
            mp_grid_add_rectangle(global.map_grid, i_x, row, i_x, row);
        }
        
    }
    else 
    {
        mp_grid_add_rectangle(global.map_grid, i_x, row, i_x, row);
    }
    
    
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
