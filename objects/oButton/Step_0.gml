virtual_key_add(x,y,sprite_width,sprite_height,button)

if !keyboard_check(button) and image_alpha < 0.5 {image_alpha+=0.1}
if keyboard_check(button) and image_alpha > 0.1 {image_alpha-=0.1}

if button = global.keyu {sprite_index = sUp}
if button = global.keyd {sprite_index = sDown}
if button = global.keyl {sprite_index = sLeft}
if button = global.keyr {sprite_index = sRight}
if button = global.keyj {sprite_index = sA}
if button = global.keya {sprite_index = sB}
if button = global.keyh {sprite_index = sHold}
if button = vk_enter {sprite_index = sEnter}
if button = vk_tab {sprite_index = sTab}