#version 130
uniform int unitWidth;
uniform int unitHeight;
uniform int numChannel;
uniform sampler2D tex;

uniform vec4 color0;
uniform vec4 color1;
uniform vec4 color2;
uniform vec4 color3;

out vec4 out_Color;
in mediump vec2 qt_TexCoord0;

#define numColors 4
#define gridWidth 0.3
#define gridHeight 0.4

void drawGrid(int x,int y){
    return;
    if((x+4)%int(gridWidth*unitWidth)==0)
        out_Color=vec4(0,0.3,0,0.3);
    if((y+4)%int(gridHeight*unitHeight)==0)
        out_Color=vec4(0,0.3,0,0.3);
}

void main( ) {
    out_Color.rgba=vec4(0,0,0,0.1);

    int x=int(qt_TexCoord0.x*unitWidth);
    int y=int(qt_TexCoord0.y*unitHeight);
    drawGrid(x,y);
    float h=1-qt_TexCoord0.y;
    vec4[] colors=vec4[numColors](
                      color0,
                      color1,
                      color2,
                      color3
                  );

    float hmax=0;
    for(int i0=0; i0<numChannel; i0++) {
        vec4 sample1= texelFetch(tex, ivec2(x,i0),0);
        hmax+=sample1.r;
        if(h<hmax) {
            out_Color=colors[i0%numColors];
            break;
        }
    }
}
