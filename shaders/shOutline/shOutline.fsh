varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texturePixel;
uniform float thickness;
uniform vec4 outlineColor;

void main()
{
    
    vec2 outlineTexture = texturePixel * thickness;
    vec4 endPixel = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    if ( texture2D(gm_BaseTexture, v_vTexcoord).a <= 0.0 ) {
        
        float alpha = 0.0;
        alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - outlineTexture.x, v_vTexcoord.y)).a);
        alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + outlineTexture.x, v_vTexcoord.y)).a);
        alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - outlineTexture.y)).a);
        alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + outlineTexture.y)).a);
        
        if (alpha != 0.0)
        {
            endPixel = outlineColor;
        }
        
    }
    
    gl_FragColor = endPixel;
}

