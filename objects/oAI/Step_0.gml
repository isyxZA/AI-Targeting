/// @description Targeting logic

if !instance_exists(targetUnit)
{
	//Search for a target
	if search
	{
		//Create a list for collisions
		var tList = ds_list_create();
		//Check for collisions and sort the list by distance
		var tNum = collision_circle_list(x, y, attackRange, oTarget, false, true, tList, true);
		//If there are targets within attack range
		if tNum > 0
		{
			//Determine which unit to target based on a given priority
			//This can be expanded further to suit many needs
			//Targets could be sorted by their health, speed or any other variable
			switch priority
			{
				case "NEAREST":
					//Target the nearest unit
					targetUnit = tList[| 0];
					break;
				case "RANDOM":
					//Target a random unit
					targetUnit = tList[| irandom(tNum-1)];
					break;
				case "A":
					//Target units of type A
					for (var i = 0; i < tNum; ++i;)
			        {
				        var tu = tList[| i];
						if tu.tType == "A"
						{
							targetUnit = tu;
							break;
						}
				    }
					//If there are no type A units then target the nearest
					if !instance_exists(targetUnit)
					{
						targetUnit = tList[| 0];
					}
					break;
				case "B":
					//Target units of type B
					for (var i = 0; i < tNum; ++i;)
			        {
				        var tu = tList[| i];
						if tu.tType == "B"
						{
							targetUnit = tu;
							break;
						}
				    }
					//If there are no type B units then target the nearest
					if !instance_exists(targetUnit)
					{
						targetUnit = tList[| 0];
					}
					break;
			}
			//Set target coordinates
			targetX = targetUnit.x;
			targetY = targetUnit.y;
			//Reset the amount shot
			shootCount = 0;
			//Attemp to shoot
			shoot = true;
		}
		else
		{
			//If no targets have been found
			search = false;
			//Start another search
			alarm[2] = searchDelay;
		}
		//Destroy the collision list
		ds_list_destroy(tList);
	}
}
else 
{
	if shoot
	{
		shoot = false;
		//Increment the amount shot
		++shootCount;
		//Shoot again after a delay
		alarm[1] = fireRate;
		//Calculate chance to hit the target
		if HitChance(accuracy)
		{
			//Hit the target
			SpawnBullet(40, 10, x, y, targetX, targetY);
		}
		else
		{
			//Possible hit
			var btx = targetUnit.x + choose(irandom_range(-32, 32), irandom_range(-32, 32));
			var bty = targetUnit.y + choose(irandom_range(-32, 32), irandom_range(-32, 32));
			SpawnBullet(40, 10, x, y, btx, bty);
		}
	}
	
	//Rotate the object towards it's target
	rotationTarget = point_direction(x, y, targetX, targetY);
	
	if image_angle != rotationTarget
	{
		image_angle += angle_difference(rotationTarget, image_angle) * 0.2;
	}
}
//Move the object
move_towards_point(waypointX, waypointY, mySpeed);