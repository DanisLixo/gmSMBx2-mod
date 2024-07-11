y -= vspd

if vspd >= 1.5 {hiccup = 0}
else if vspd <= 0.25 {hiccup = 1}
if hiccup = 0 {vspd -= 0.1}
if hiccup = 1 {vspd += 0.1}

if y < 32 {instance_destroy()}