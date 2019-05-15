//MatCap to Godot by ArthurAlk . Edited K. S. Ernest (iFire) Lee
//This shader looks like blender matcap

shader_type spatial;

uniform sampler2D mat_cap;
uniform bool fix_back = true;

void vertex() {
 if (NORMAL.z < 0.0 && fix_back) {
    NORMAL.z = 0.0;
  }
}

void fragment() {
  vec2 v_n = (NORMAL.xy / 2.0) + vec2(0.5, 0.5);
  v_n.y = (v_n.y * -1.0) + 1.0;

  //This applies your MatCap to Model using the created UV
  ALBEDO = texture(mat_cap, v_n).rgb;
}