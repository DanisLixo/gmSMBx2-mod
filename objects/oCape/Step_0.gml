if !instance_exists(m) {instance_destroy()}
else {
if m.powerup != "c" {instance_destroy()}

x = (m.image_xscale)? m.bbox_left+2 : m.bbox_right-2;
y = m.bbox_top
depth = m.depth
image_alpha = m.image_alpha
}