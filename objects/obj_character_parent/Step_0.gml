/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 


//回溯逻辑
{
if(mouse_check_button(mb_left)&&(!global.rewinding)){
	global.rewinding = true;
	// 初始化回溯计时器，从当前帧开始回溯
    obj_game_manager.rewind_timer = 0;
    
	if (instance_exists(obj_past)) {
    instance_destroy(obj_past);
	show_debug_message(1);
}

	instance_create_layer(x,y,"Instances",obj_past)
}

// 鼠标左键松开，结束回溯
if (mouse_check_button_released(mb_left) && global.rewinding) {
    global.rewinding = false;
	
    // 获取回溯结束时的玩家位置
    var final_rewind_pos_x = x;
    var final_rewind_pos_y = y;

    // 覆盖已被回溯的历史记录
    var frames_to_overwrite = obj_game_manager.rewind_timer;
    for (var i = 0; i < frames_to_overwrite; i++) {
        var history_pos_to_update = (obj_game_manager.history_index - i - 1 + obj_game_manager.history_size) % obj_game_manager.history_size;
        obj_game_manager.player_history[history_pos_to_update] = [final_rewind_pos_x, final_rewind_pos_y];
    }
    // 重置回溯计时器，以便下次使用
    //obj_game_manager.rewind_timer = 0;
	
}

// 如果正在回溯
if (global.rewinding) {
    // 增加回溯计时器
    obj_game_manager.rewind_timer++;
    
    // 计算历史数组中的索引。history_index 是下一个写入位置，所以要减去1
    obj_game_manager.rewind_index = (obj_game_manager.history_index - obj_game_manager.rewind_timer);
	
	//obj_game_manager.player_history[obj_game_manager.rewind_index + 1] = obj_game_manager.player_history[obj_game_manager.rewind_index]
    
    // 处理循环索引，确保它始终在 0 到 history_size-1 之间
    if (obj_game_manager.rewind_index < 0) {
        obj_game_manager.rewind_index += obj_game_manager.history_size;
    }
    
    // 检查是否回溯到了最远的记录（600帧）
    if (obj_game_manager.rewind_timer >= obj_game_manager.history_size) {
        // 达到最大回溯时长，结束回溯
        global.rewinding = false;
		// 获取回溯结束时的玩家位置
		var final_rewind_pos_x = x;
		var final_rewind_pos_y = y;

		// 覆盖已被回溯的历史记录
		var frames_to_overwrite = obj_game_manager.rewind_timer;
		for (var i = 0; i < frames_to_overwrite; i++) {
        var history_pos_to_update = (obj_game_manager.history_index - i - 1 + obj_game_manager.history_size) % obj_game_manager.history_size;
        obj_game_manager.player_history[history_pos_to_update] = [final_rewind_pos_x, final_rewind_pos_y];
		}
    } 
	else {
        var past_pos = obj_game_manager.player_history[obj_game_manager.rewind_index];
        
        // 只有当 past_pos 是一个有效的数组时才进行回溯
        if (is_array(past_pos)) {
            // 将玩家的位置设置为过去的位置
            x = past_pos[0];
            y = past_pos[1];
        
            // 使用 exit 关键字，立即跳出当前步事件，阻止玩家的正常移动逻辑
            exit;
        } else {
            // 如果历史记录无效，则停止回溯，以防错误
            global.rewinding = false;
        
        // 使用 exit 关键字，立即跳出当前步事件，阻止玩家的正常移动逻辑
        exit;
		}
    }
}
}

//未来标记逻辑
if(mouse_check_button(mb_right)){
	if(!global.rewinding){
		if (instance_exists(obj_future)) {
		exit;
		}
	instance_create_layer(x,y,"Instances",obj_future);
	}
}

// 这部分是像素级碰撞的实现组件之一
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
		// In that case, move_once is added to the X coordinate of the character.
		x += _move_once;
	}
	// This 'else' block runs if a collision was found.
	else
	{
		// In that case, we reset the X velocity to 0, so the character stops its movement on that axis.
		self.vel_x -= last_vel_x;
	
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
		if(place_meeting(0,1,obj_platform)){
			vel_y += obj_platform.vel_y;
		}
		else
		// In that case, we reset the Y velocity to 0, so the character stops its movement on that axis.
		{self.vel_y -= last_vel_y;}
	
		// Then we break out of the Repeat loop, as no more collision checks are required.
		break;
	}
}
}
//grounded = check_collision(0, 1);

