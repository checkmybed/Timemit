/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

// Inherit the parent event
event_inherited();

if(global.rewinding == 1){exit;}
// 根据速度和角度计算移动分量
//var _dir_x = lengthdir_x(move_speed, radtodeg(move_angle));
//var _dir_y = lengthdir_y(move_speed, radtodeg(move_angle));

// 更新已移动距离（直接使用速度值）
current_distance += move_speed;
show_debug_message(move_speed)
// 距离检测与方向反转
if (current_distance >= max_distance) {
	if(once == true){move_speed = 0;}
    move_angle += pi; // 掉头，角度增加180度
	move_angle = move_angle mod (2*pi);
    current_distance = 0; // 重置距离计数
}

{
// 在两个轴向实现逐像素的碰撞检测，就是移动一像素就检测一次碰撞
// 'move_count' 是本帧内移动的像素总数，即速度的绝对值。
// 'move_once' 是对移动像素的方向表示，其值取速度的符号，即1，0，-1。
var _move_count = abs(self.vel_x);
var _move_once = sign(self.vel_x);

// This runs a loop, which runs 'move_count' times. All code in this block is repeated that many amount of times.
repeat (_move_count)
{
	// This calls the check_collision function to check for collisions on the X axis, if moved by the move_once value on that dimension.
	// The Y argument is set to 0, so for this collision there is no Y movement.
	// The result of the function, either true or false, is stored in the 'collision_found' variable, which is temporary.
	var _collision_found = check_collision(_move_once, 0);

	// This checks if collision_found is false, meaning a collision was not found, and the player is free to move once on the X axis.
	if (!_collision_found)
	{
		if(place_meeting(x,y-1,obj_player)){
			x += _move_once;
			obj_player.x += _move_once;
			//break;
			//vel_y += obj_platform.vel_y;
		}
		// In that case, move_once is added to the X coordinate of the character.
		x += _move_once;
	}
	// This 'else' block runs if a collision was found.
	else
	{
		// In that case, we reset the X velocity to 0, so the character stops its movement on that axis.
		self.vel_x = 0;
	
		// Then we break out of the Repeat loop, as no more collision checks are required.
		break;
	}
}

// We now repeat all of the previous steps to check for collisions on the Y axis.
// Everything is the same, but vel_x is replaced by vel_y, and the check_collision function takes a Y value (its second argument).
_move_count = abs(self.vel_y);
_move_once = sign(self.vel_y);

// This runs a loop, which runs 'move_count' times. All actions attached to this are repeated that many amount of times.
repeat (_move_count)
{
	// This calls the check_collision function to check for collisions on the Y axis, if moved by the move_once value.
	// The result of the function, either true or false, is stored in the 'collision_found' variable, which is temporary.
	var _collision_found = check_collision(0, _move_once);

	// This checks if collision_found is false, meaning a collision was not found, and the player is free to move once on the Y axis.
	if (!_collision_found)
	{
		// In that case, move_once is added to the Y coordinate of the character.
		y += _move_once;
	}
	// This 'else' block runs if a collision was found.
	else
	{
		if(place_meeting(x,y-1,obj_player)){
			obj_player.y += _move_once;
			y += _move_once;
			//break;
			//vel_y += obj_platform.vel_y;
		}
		else
		// In that case, we reset the Y velocity to 0, so the character stops its movement on that axis.
		self.vel_y = 0;
	
		// Then we break out of the Repeat loop, as no more collision checks are required.
		break;
	}
}
}