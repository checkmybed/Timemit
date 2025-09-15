/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
/*
if(place_meeting(x,y,[obj_player,obj_past,obj_future])){
	if(open_number == 1 && triggle = 0){
	partner.is_open1 = true;
	triggle = 1;
	}
}
*/
if(open_number == 1){
	if(place_meeting(x,y,[obj_player,obj_past,obj_future])){
		partner.is_open1 = true;
	}
	else{
		partner.is_open1 = false;
	}
}

if(open_number == 2){
	if(place_meeting(x,y,[obj_player,obj_past,obj_future])){
		partner.is_open2 = true;
	}
	else{
		partner.is_open2 = false;
	}
}

if(open_number == 3){
	if(place_meeting(x,y,[obj_player,obj_past,obj_future])){
		partner.is_open3 = true;
	}
	else{
		partner.is_open3 = false;
	}
}