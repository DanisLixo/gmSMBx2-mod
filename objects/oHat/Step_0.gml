if !instance_exists(m) {instance_destroy()}
else {
	image_alpha = m.image_alpha
	depth = m.depth-5
	x = m.x; y = m.bbox_top-2;
}

