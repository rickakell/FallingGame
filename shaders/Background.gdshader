shader_type canvas_item;
uniform float scroll_speed;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 shiftedUV = UV;
	shiftedUV.x += TIME * scroll_speed;
	vec4 col = texture(TEXTURE,shiftedUV);
	COLOR = col;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
