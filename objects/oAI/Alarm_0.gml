/// @description Find a new waypoint
if mySpeed != 0
{
	waypointX = irandom(room_width);
	waypointY = irandom(room_height);

	alarm[0] = irandom_range(200, 600);
}