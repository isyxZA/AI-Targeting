/// @description Shoot trigger

//If a full burst has been fired
if shootCount >= shootAmount
{
	//Remove the target and search again to make sure we have a priority target
	targetUnit = noone;
}
else
{
	if instance_exists(targetUnit)
	{
		targetX = targetUnit.x;
		targetY = targetUnit.y;
		//If the target is still within attack range
		if point_distance(x, y, targetX, targetY) < attackRange
		{
			//Fire a bullet
			shoot = true;
		}
		else
		{
			//The target has moved out of range...search for a new target
			targetUnit = noone;
		}
	}
}