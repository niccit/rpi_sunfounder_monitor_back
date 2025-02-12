$fa = 1;
$fs = 0.4;


vpl = 69;
vpw = 100;
vph = 16;

module video_plate() {
    union() {
        difference() {
            cube([vpl,vpw,vph], center=true);  // outer cube
            translate([0, 0, 2])
                cube([vpl-4, vpw-4, vph-2], center=true);  // inner cube
            translate([-(vpl/2) + 4, 0, 1])
                cube([15, vpw, vph], center=true); // cut out for adjoining plates
            translate([(vpl/2) - 42, -(vpw/ 2), 0])
                cube([vpl, 10, 26], center=true); // power, HDMI, USB-C
            translate([-(vpl/2) + 65, (vpw/2) - 7, -vph / 2])
                cylinder(d=3, h=3); // top stand side standoff hole
            translate([-(vpl/2) + 65, (vpw/2) - 87, -vph / 2])
                cylinder(d=3, h=3); // bottom stand side standoff hole
            translate([-(vpl/2) + 5, (vpw/2) - 7, -vph / 2])
                cylinder(d=3, h=3); // top video board pi side standoff hole
            translate([-(vpl/2) + 5, (vpw/2) - 87, -vph / 2])
                cylinder(d=3, h=3); // bottom video board pi side standoff hole
            translate([(vpl/2),(vpw/2)-20,1.5])
                cube([5, 15, 15], center=true); // access to power button on video parent_module
        }
        translate([-(vpl/2)+ 5.75,-(vpw/2) + 3,-7.5])
            cube([11.5,5,1], center=true);
        translate([-27, 49, 1.5])
            cube([10, 2, 13.25], center=true);
    }
}


video_plate();



