//SHADERTOY PORT FIX
#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

uniform float xwave;
uniform float ywave;
uniform float xtime;
uniform float ytime;

void mainImage(  )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
	
	// this is actually fun lmfaoo
    uv.x += sin(uv.y*xwave+iTime)/xtime;
	uv.y += sin(uv.x*ywave+iTime)/ytime;
    //

	vec4 color = texture(iChannel0, uv);
	
	fragColor = color;
}