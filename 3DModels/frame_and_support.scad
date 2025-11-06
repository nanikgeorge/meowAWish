//this is the PCB. I don't think I actually need it...
//import("/home/nanik/Documents/myProjects/cat_shooting_star_sao/shooting_star_sao/shooting_star_sao.stl");

board_tolerance = 0.2;

module rounded_cube(x,y,z,r) {
    
    hull(){
        translate([r,r,0])cylinder(h=z, r=r, $fn=100);
        translate([r,y-r,0])cylinder(h=z, r=r, $fn=100);
        translate([x-r,r,0])cylinder(h=z, r=r, $fn=100);
        translate([x-r,y-r,0])cylinder(h=z, r=r, $fn=100);
    }
}


module frame() {
difference() {
    rounded_cube(55,55,10,3);
    translate([2.5-board_tolerance, 2.5-board_tolerance,0])cube([50+(2*board_tolerance), 50+(2*board_tolerance), 8]);
    translate([2.5+1, 2.5+1,0])rounded_cube(48, 48, 12,3);
}
}

module support() {
difference() {
    cube([50,50,5]);
    translate([2,2,0])cube([46,46,5]);
}

intersection(){
    cube([50,50,5]);
    difference() {
        cylinder(r=34,h=5, $fn=100);
        cylinder(r=32,h=5, $fn=100);
    }
}
}

//cube([55, 55, 2]);

frame();

translate([60,0,0])support();