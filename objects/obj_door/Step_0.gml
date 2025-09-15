/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

// Inherit the parent event
event_inherited();

if(is_open1 && is_open2 && is_open3 && open == false){
	if(once_time == true){
		instance_destroy();
	}
	else{
		y -= 10000;
		open = true;
	}
}

if(!(is_open1 && is_open2 && is_open3) && open = true){
	y += 10000;
	open = false;
}
