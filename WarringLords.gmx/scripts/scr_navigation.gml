/// scr_navigation(start_x,start_y,end_x,end_y,pace)
var start_x = argument0;
var start_y = argument1;
var end_x = argument2;
var end_y = argument3;
var pace = argument4;
/*
show_message//bug hunt code
(
    "start_x:"+string(start_x)+
    "#start_y:"+string(start_y)+
    "#end_x:"+string(end_x)+
    "#end_y:"+string(end_y)+
    "#pace:"+string(pace)
);*/
audio_play_sound(global.selected.move_snd, 10, true);
//audio_stop_sound(global.selected.move_snd)
if !(mp_grid_path(global.map_grid, global.navigate,start_x,start_y,end_x,end_y,1))
{
    show_message("you can't move there");
    return false;
}
else
{
    mp_grid_path(global.map_grid, global.navigate,start_x,start_y,end_x,end_y,1)
    path_start(global.map_grid, pace,0,false);
    return true;
}
