y -= vspd

if vspd >= 1.2 {hiccup = 0}
else if vspd <= 0.5 {hiccup = 1}
if hiccup = 0 {vspd -= 0.1}
if hiccup = 1 {vspd += 0.1}

if y < 36 or instance_number(object_index) > 3 {instance_destroy()}