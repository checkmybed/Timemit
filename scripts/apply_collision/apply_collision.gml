// v2.3.0的脚本资产已更改，请参见\ n // https://help.yoyogames.com/hc/en-us/articles/360005277377
function apply_collision(){
// 这部分是像素级碰撞的实现组件之一
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
		// In that case, we reset the Y velocity to 0, so the character stops its movement on that axis.
		self.vel_y = 0;
	
		// Then we break out of the Repeat loop, as no more collision checks are required.
		break;
	}
}
}