#version 300 es
precision highp float;
precision highp int;
out vec4 fragColor;
uniform float u_time;
uniform vec2 u_resolution;
void main(){
    vec2 pos = gl_FragCoord.xy / u_resolution.xy;
    pos *= vec2(32.0,9.0); //scale coordinate

    uint[9] a = uint[](
        uint(u_time),
        0xbu,//unsinged int B
        9u,//unsigned int 9
        0xbu ^ 9u,// XOR
        0xffffffffu,// max value of unsigned int
        0xffffffffu + uint(u_time),// buffer overflow
        floatBitsToUint(floor(u_time)),//convert to uint from bit rows of float
        floatBitsToUint(-floor(u_time)),
        floatBitsToUint(11.5625)
    );
    if(fract(pos.x) < 0.1){
        if(floor(pos.x) == 1.0){
            fragColor = vec4(1, 0, 0, 1);
        }else if(floor(pos.x) == 9.0){
            fragColor = vec4(0, 1, 0, 1);
        }else{
            fragColor = vec4(0.5);
        }
    }else if(fract(pos.y) < 0.03){
        fragColor = vec4(0.5);
    }else{
        uint b = a[int(pos.y)];
        b = (b << uint(pos.x) >> 31);
        fragColor = vec4(vec3(b), 1.0);
    }
}