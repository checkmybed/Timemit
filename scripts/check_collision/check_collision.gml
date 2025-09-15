// v2.3.0的脚本资产已更改，请参见\ n // https://help.yoyogames.com/hc/en-us/articles/360005277377
// v2.3.0的脚本资产已更改，请参见\ n // https://help.yoyogames.com/hc/en-us/articles/360005277377
function check_collision(_move_x,_move_y)
{
	//检测与对象的碰撞，使用碰撞父类物体进行检测
	if (place_meeting(x + _move_x, y + _move_y, [obj_collision,obj_character_parent]))
	{
		return true;
	}
	
	//检测碰撞瓦片层，瓦片数据由obj_game_manager获取。
	var _left_top = tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + _move_x, bbox_top + _move_y);
	
	var _right_top = tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_right + _move_x, bbox_top + _move_y);
	
	var _right_bottom = tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_right + _move_x, bbox_bottom + _move_y);
	
	var _left_bottom = tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + _move_x, bbox_bottom + _move_y);
	
	if (_left_top or _right_top or _right_bottom or _left_bottom)
	{
		return true;
	}
}