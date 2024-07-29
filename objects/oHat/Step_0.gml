if !instance_exists(m) {instance_destroy()}
else {
	image_alpha = m.image_alpha
	depth = m.depth+1
}

if global.player =  "Pokey" {x = oMario.x; y = oMario.bbox_top-2;}
else if global.player =  "Gemaplys" {x = oMario.x; y = oMario.bbox_top-2;}