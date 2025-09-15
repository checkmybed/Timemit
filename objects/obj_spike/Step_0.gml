/// @description 在此处插入描述 

if(global.rewinding == 1){exit;}
// 你可以在此编辑器中写入代码 
// 根据速度和角度计算移动分量
var _dir_x = lengthdir_x(move_speed, radtodeg(move_angle));
var _dir_y = lengthdir_y(move_speed, radtodeg(move_angle));

// 更新已移动距离（直接使用速度值）
current_distance += move_speed;


// 距离检测与方向反转
if (current_distance >= max_distance) {
	if(once == true){move_speed = 0;}
    move_angle += pi; // 掉头，角度增加180度
	move_angle = move_angle mod (2*pi);
    current_distance = 0; // 重置距离计数
}

var _move_count = abs(self.vel_x);
var _move_once = sign(self.vel_x);

// This runs a loop, which runs 'move_count' times. All code in this block is repeated that many amount of times.
repeat (_move_count)
{
		x += _move_once;
	
}

// We now repeat all of the previous steps to check for collisions on the Y axis.
// Everything is the same, but vel_x is replaced by vel_y, and the check_collision function takes a Y value (its second argument).
_move_count = abs(self.vel_y);
_move_once = sign(self.vel_y);

// This runs a loop, which runs 'move_count' times. All actions attached to this are repeated that many amount of times.
repeat (_move_count)
{
		y += _move_once;
	
}