shader_type canvas_item;
render_mode blend_mix;

uniform float outlineSize  = 1;
uniform vec4  outLineColor : hint_color;

void fragment()
{
    vec4 col = texture(TEXTURE, UV);

    if (col.a == 0.0)
    {
		for(float i = 1.0; i < outlineSize + 1.0; i++)
		{
	        if (texture(TEXTURE, UV + vec2(0.0,          i * TEXTURE_PIXEL_SIZE.y)).a  != 0.0 ||
	            texture(TEXTURE, UV + vec2(0.0,         -i * TEXTURE_PIXEL_SIZE.y)).a  != 0.0 ||
	            texture(TEXTURE, UV + vec2(i * TEXTURE_PIXEL_SIZE.x,  0.0)).a          != 0.0 ||
	            texture(TEXTURE, UV + vec2(-i * TEXTURE_PIXEL_SIZE.x, 0.0)).a          != 0.0)
	            col = outLineColor;
		}
    }

    COLOR = col;
}