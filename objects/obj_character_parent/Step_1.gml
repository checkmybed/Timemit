/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 
// In this part we are applying friction to the player's velocity, so it eventually comes to a stop when there is no input.
// The 'round' function rounds the X velocity to the nearest integer. Then it checks if that integer is NOT 0. This means there is an
// active velocity of (or more than) 0.5 pixels in either direction.

grounded = check_collision(0, 1);

if (!keyboard_check(ord("A")) || !keyboard_check(ord("D")) && round(vel_x) != 0)
{
	// Here we calculate the friction that should be applied this frame. It is calculated by multiplying the sign of the X velocity (which
	// will be -1 or 1) with the friction power. The result is stored in a local variable.
	var _friction_applied = sign(vel_x) * friction_power;

	// The friction value is then subtracted from the X velocity.
	vel_x -= _friction_applied;
}
// This 'else' block runs when there is no X velocity, or it's less than 0.5 pixels in either direction.
else
{
	// In that case we reset the X velocity to 0 so the character comes to a complete stop.
	vel_x = 0;
}

// This adds the grav_speed value to the vel_y variable.
// Doing so applies gravity to the character's vertical velocity, pulling it down each frame to make it fall.
vel_y += gravity_speed;
if (vel_y > 5){vel_y = 5;}
last_vel_x = vel_x;
last_vel_y = vel_y;