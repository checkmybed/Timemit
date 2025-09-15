/// @description 获取碰撞瓦片
// 获得碰撞瓦片地图ID
collision_tilemap = layer_tilemap_get_id("CollisionTiles");

// 正常游戏时，记录玩家位置
if (!global.rewinding) { // 使用全局变量来控制回溯状态
    // 确保玩家对象存在
    if (instance_exists(obj_player)) {
        // 创建一个子数组，存储当前玩家的 x, y 和游戏时间
        var player_pos = [obj_player.x, obj_player.y, get_timer()];

        // 将数据写入数组的当前索引位置
        player_history[history_index] = player_pos;

        // 更新索引，形成一个循环缓冲区
        history_index = (history_index + 1) % history_size;
    }
}

