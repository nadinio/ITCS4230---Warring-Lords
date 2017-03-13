/// scr_navigation(start_x,start_y,end_x,end_y,pace)
var start_x = argument0;
var start_y = argument1;
var end_x = argument2;
var end_y = argument3;
var pace = argument4;


if !(mp_grid_path(global.map_grid, global.navigate,start_x,start_y,end_x,end_y,1))
{
    show_message("you can move there");
    return false;
}
else
{
    mp_grid_path(global.map_grid, global.navigate,start_x,start_y,end_x,end_y,1)
    path_start(global.map_grid, pace,0,false);
    return true;
}
