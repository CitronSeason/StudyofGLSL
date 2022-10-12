#version 300 es
precision highp float;
out vec4 fragColor;
uniform vec2 u_resolution;
int channel;
void main(){
    vec3[4] col4 = vec3[](
        vec3(1.0, 0.0, 0.0),
        vec3(0.0, 0.0, 1.0),
        vec3(0.0, 1.0, 0.0),
        vec3(1.0, 1.0, 0.0)
    );
    vec2 pos = gl_FragCoord.xy / u_resolution;// 0 - 1に正規化
    float n = 4.0;
    pos *= n;//0 - 4に
    channel = int( 2.0 * gl_FragCoord.x / u_resolution.x);
    // pos 0 - 1を二倍してfloor(floorはfloatを返すので ifで使えるint関数がいい)

    if(channel >= 0){
        pos = floor(pos) + step(0.5, fract(pos));
        
    }else{
        pos.x *= 2.0;
    //int ind = int(pos.x);
    }
    pos /= n;// 0 - 4 -> 0 - 1
    vec3 col = mix( mix(col4[0], col4[1], pos.x), mix(col4[2], col4[3], pos.x), pos.y);
    fragColor = vec4(col, 1.0);
}