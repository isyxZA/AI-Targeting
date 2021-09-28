move_towards_point(waypointX, waypointY, 1);

if tHealth <= 0
{
	effect_create_below(ef_spark, x, y, 1, c_silver);
	effect_create_above(ef_ring, x, y, 1, c_orange);
	instance_destroy();
}