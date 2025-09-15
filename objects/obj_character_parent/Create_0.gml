/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

//以下为运动相关变量
vel_x = 0;
vel_y = 0;
max_vel_x = 2;
max_vel_y = 5;
gravity_speed = 1;
friction_power = 0.3;
grounded = false;
jump_speed = 12;
last_vel_x = 0;
last_vel_y = 0;


if(instance_exists(obj_game_manager)){
	var i = 0;
	repeat(600){
		obj_game_manager.player_history[i] = [x ,y, get_timer()]
		i++;
	}
}