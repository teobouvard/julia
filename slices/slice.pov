#version 3.7;
#include "metals.inc"
#include "finish.inc"
#include "textures.inc"
#include "rad_def.inc"
#include "colors.inc"

#declare VP = <-3,2,2>;
#declare VU = <0,1,0>;
#declare VD = vnormalize(<0,0,0> - VP);
#declare VR = vcross(VU,VD);
#declare ConstC = <-0.08,0.0,-0.83,-0.025>;
#declare SLICEDIST = clock;

camera {
   location VP
   right x*image_width/image_height
   angle 50
   sky VU
   look_at VD
}

global_settings {
   //radiosity {
   //   Rad_Settings(Radiosity_Normal,off,off)
   //}
   ambient_light rgb <1, 1, 1>
   assumed_gamma 2.2
}

background {
   color Black
}

light_source {
   VP + VU + 2*VR
   color rgb <1,1,1>
}

light_source {
   VP - VR
   color rgb <1,1,1>
}

julia_fractal {
   ConstC
   quaternion
   sqr
   max_iteration 17
   precision 1000
   slice <0, 0, 0, 1> SLICEDIST
   //finish { 
   //   diffuse 0.9
   //   phong 1
   //}
   texture { 
      T_Brass_5C
   }
}
