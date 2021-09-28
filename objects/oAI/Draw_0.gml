draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y + 20, priority);
draw_set_color(c_black);
draw_set_alpha(0.1);
draw_circle(x, y, attackRange, false);
draw_set_color(c_white);
draw_circle(x, y, attackRange, true);
draw_set_alpha(0.2);
if instance_exists(targetUnit) { draw_line(x, y, targetX, targetY); }
draw_set_alpha(1);