include <MCAD/involute_gears.scad>

$fn =30;

servo_gear(number_of_teeth =23, hole_diameter =5 ,hole_distance = 8);
// servo_fitting();
module gear_tube(height, outer_diameter, inner_diameter, pressure_angle = 28, number_of_teeth = 20){
    union(){
        difference(){
            cylinder(h = height, d = outer_diameter);
            cylinder(h = height, d = inner_diameter);
        }
        translate([0,0,3]){
            difference(){
                cylinder(h = 1, d = outer_diameter + 2);
                cylinder(h = 1, d = inner_diameter);
            }
        }
        translate([0,0,1.5]){
            linear_extrude(height = 3, center = true, convexity = 10, twist = 0){
                gear(
                    number_of_teeth=number_of_teeth,
                    pressure_angle = pressure_angle,
                    bore_diameter = outer_diameter,
                    circular_pitch=200,
                    flat=true);
            }
        }
    }
}

module servo_gear(number_of_teeth =20, pressure_angle = 28){
    union(){
        linear_extrude(height = 3, center = true, convexity = 0, twist = 0){
            difference(){        
                gear(number_of_teeth=number_of_teeth,
                    pressure_angle = pressure_angle,
                    bore_diameter = 6.8,
                    circular_pitch=200,
                    flat=true);
                union(){
                    translate([8,0,0]){circle(d =2);}
                    translate([-8,0,0]){circle(d =2);}
                    translate([0,8,0]){circle(d =2);}
                    translate([0,-8,0]){circle(d =2);}     
                }
            }
        }
        translate(){
            linear_extrude(height = 0.5, center = true, convexity = 0, twist = 0){
                difference(){
                    circle(d = 6.8);
                    circle(d = 2.5);
                }
            }
        }
        translate([0,0,-2]){
            linear_extrude(height = 4, center = true, convexity = 0, twist = 0){
                difference(){
                    circle(d = 6.8);
                    gear(number_of_teeth = 20,pressure_angle = 30, circular_pitch=46,bore_diameter =0,flat=true);
                    // pressure_angle = 30,
                }
            }
        }

    }

}

module servo_fitting(){
     linear_extrude(height = 4, center = true, convexity = 0, twist = 0){
        difference(){
            circle(d = 6.8);
            gear(number_of_teeth = 20,pressure_angle = 30, circular_pitch=46,bore_diameter =0,flat=true);
            // pressure_angle = 30,
        }
     }
}