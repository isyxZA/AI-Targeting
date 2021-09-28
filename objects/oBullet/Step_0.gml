//Generate the path and begin movement
if bStartPath
{
	bStartPath = false;
    path_clear_points(bPath);
    path_add_point(bPath, x, y, bSpeed);
    path_add_point(bPath, bTargetX, bTargetY, bSpeed);
    path_set_closed(bPath, false);
    path_start(bPath, bSpeed, path_action_stop, 0);
    bMoving = true;
	//Enable collision checking
	alarm[1] = room_speed;
	//Rotate bullet
    image_angle = point_direction(x, y, bTargetX, bTargetY);
}

if bMoving
{
	//End of the travel path has been reached
	if path_position == 1 
	{
		//Check for collisions with oTarget
		var co = instance_place(x, y, oTarget);
		if co != noone
		{
			//Remove health from oTarget
			co.tHealth -= bDamage;
		}
		//Destroy the bullet
        bMoving = false;
		instance_destroy();
	}
}