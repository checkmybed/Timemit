/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

//初始化碰撞地图
collision_tilemap = 0;

// 初始化用于存储玩家位置和时间的数组
// 数组大小为601，存储最近600帧的数据（10秒 * 60帧/秒）
// 索引 0-599 用于存储数据，索引 600 可作为循环缓冲区指示器
player_history = array_create(601);
history_size = 600; // 存储帧数
history_index = 0;  // 当前写入的索引
global.rewinding = false; //回溯状态
rewind_timer = 0;