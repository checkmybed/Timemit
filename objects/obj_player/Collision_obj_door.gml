/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
if(bbox_right > other.bbox_right && bbox_left < other.bbox_right){
	 x += other.bbox_right - bbox_left ;
}
if(bbox_right > other.bbox_left && bbox_left < other.bbox_left){
	 x += other.bbox_left - bbox_right ;
}