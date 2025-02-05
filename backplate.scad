$fa = 1;
$fs = 0.4;

video = false;
touchscreen = true;
both = false;
if (video == true) {
    video_plate();
}
if (touchscreen == true) {
    // translate([-26.25, -44, 0]) // checking horizontal alignment of standoff holes
    // translate([74.5, -43, 0]) // checking vertical alignment of standoff holes
        touchscreen_plate();
}

if (both == true) {
    video_plate();
    translate([-106, 0, -0.5])
        touchscreen_plate();
}


vpl = 69;
vpw = 100;
vph = 16;

module video_plate() {
    union() {
        difference() {
            cube([vpl,vpw,vph], center=true);  // outer cube
            translate([0, 0, 2])
                cube([vpl - 2, vpw - 2, vph], center=true);  // inner cube
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
                cube([3, 15, 15], center=true); // access to power button on video parent_module
        }
        translate([-(vpl/2)+ 5.75,-(vpw/2) + 3,-7.5])
            cube([11.5,5,1], center=true);
    }
}

tpl = 157;
tpw = 100;
tph = 19;
module touchscreen_plate() {
    union() {
        difference() {
            cube([tpl, tpw, tph], center=true); // outer cube
            translate([1, 0, 2])
                cube([tpl-2, tpw-2, tph], center=true); // inner cube
            translate([tpl/2 - 2, 0 , 0])
                cube([10, tpw, tph], center=true); // cut off 10 cm lip
            translate([-(tpl/2) + 4, (tpw/2) - 7, -(tph/2)])
                cylinder(d=3, h=3); // top stand side standoff hole
            translate([-(tpl/2) + 4, (tpw/2) - 87, -(tph/2)])
                cylinder(d=3, h=3); // bottom stand side standoff hole
            translate([-(tpl/2) + 95, (tpw/2) - 37, -9])
                color("green") cube([97, 66, 4], center=true);  // Raspberry Pi
            translate([(-tpl/2) + 64, (-tpw/2) + 9, 0])
                color("red") cube([109, 18, tph], center=true); // slot for portable battery
            translate([tpl/2 - 36, -tpw/2, 0])
                color("blue") cube([5, 10, tph], center=true);   // cut out to get to power switch
        }
        difference() {
            translate([tpl/2 - 4, 0 , -8.75])
                cube([10, tpw, 1.5], center=true); //  lip where cover connects to video side
            translate([-(tpl/2) + 154 , (tpw/2) - 7, -(tph/2)])
                cylinder(d=3, h=3); // pi side video top standoff hole
            translate([-(tpl/2) + 154 , (tpw/2) - 87, -(tph/2)])
                cylinder(d=3, h=3); // pi side video standoff hole
        }
    }
}




