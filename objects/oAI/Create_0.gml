//Set the target priority
/*
	NEAREST will target the nearest unit
	RANDOM will choose a random target
	A will target units with tType A first
	B will target units with tType B first
*/
priority = choose("NEAREST", "RANDOM", "A", "B");

//Search trigger
search = true;

//Delay between search attempts
searchDelay = room_speed;

//The target object
targetUnit = noone;

//Target x position
targetX = x;

//Target y position
targetY = y;

//Attack range
attackRange = irandom_range(100, 300);

//Shoot trigger
shoot = false;

//Amount shot
shootCount = 0;

//Burst amount
shootAmount = 6;

//Object rotation target
rotationTarget = 0;

//Rate of fire
fireRate = room_speed * 0.2;

//Accuracy...0.3 = 30% chance to hit the target
accuracy = 0.3;

//Movement setup
waypointX = irandom(room_width);
waypointY = irandom(room_height);
mySpeed = choose(0, 0.2, 0.3, 0.4, 0.5);
alarm[0] = irandom_range(200, 600);