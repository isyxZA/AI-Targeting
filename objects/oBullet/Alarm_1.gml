/// @description Collision checking

if bMoving 
{ 
	//Check for collisions with oTarget
	var co = instance_place(x, y, oTarget);
	if co != noone
	{
		//Remove health from oTarget
		co.tHealth -= bDamage;
		//Destroy the bullet
		bMoving = false;
        path_speed = 0;
		instance_destroy();
	}
	else
	{
		//No collision...check again
		alarm[1] = 1; 
	}
}