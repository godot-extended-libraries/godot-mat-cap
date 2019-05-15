# Material Captures for Godot 3.1

Sources:
* Material Sample from Godot
* Environment from https://github.com/fire/godot-realistic-water
* https://devtalk.blender.org/t/call-for-content-matcaps/737/257?u=regnas

```
//MatCap to Godot by ArthurAlk . Edited K. S. Ernest (iFire) Lee
//This shader looks like blender matcap

shader_type spatial;

uniform sampler2D mat_cap;
uniform float fix_back = 1.0;

void vertex() {
    float less_than_zero = NORMAL.z < 0.0;
    float t = less_than_zero * fix_back;
    t = max(min((t -  0.5), 0.0) * 10.0, 1.0)
    NORMAL.z * t
    }
}






void fragment() {
vec2 v_n = (NORMAL.xy / 2.0) + vec2(0.5, 0.5);
v_n.y = (v_n.y * -1.0) + 1.0;

//This applies your MatCap to Model using the created UV
ALBEDO = texture(mat_cap, v_n).rgb;
}
```

floor(a + 0.5). 
