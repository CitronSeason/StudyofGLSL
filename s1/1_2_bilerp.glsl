#version 300 es
precision highp float;
out vec4 fragColor;
uniform vec2 u_resolution;

void main(){
    vec3[4] col4 = vec3[](
        vec3(1.0, 0.0, 0.0),
        vec3(0.0, 0.0, 1.0),
        vec3(0.0, 1.0, 0.0),
        vec3(1.0, 1.0, 0.0)
    );
    vec2 pos = gl_FragCoord.xy / u_resolution;
    pos.x *= 2.0;
    //int ind = int(pos.x);
    vec3 col = mix(col4[0], col4[1], pos.x),
}