/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
if(!global.rewinding){
	--future_time;
}
if(future_time < 0){
	instance_destroy();
}