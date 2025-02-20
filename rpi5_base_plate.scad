$fa = 1;
$fs = 0.4;

include <YAPP_Box/YAPPgenerator_v3.scad>;

printBaseShell = true;
printLidShell = false;

pcbLength = 85;
pcbWidth =  56;

wallThickness = 2;
basePlaneThickness = 3.0;

ridgeHeight = 6;
ridgeSlack = 0.2;

paddingFront = 5.0;
paddingBack = 1.0;
paddingRight = 1.0;
paddingLeft = 1.0;

baseWallHeight = 25;

standoffHeight = 5;
standoffDiameter = 5;
standoffPinDiameter = 0;
standoffHoleSlack = 0;

// standoffs
pcbStands =
[   [5, 5, standoffHeight, default, standoffDiameter, standoffPinDiameter, standoffHoleSlack, 0.5, yappBackLeft, yappBackRight, yappBaseOnly]
    ,[27, 5, standoffHeight, default, standoffDiameter, standoffPinDiameter, standoffHoleSlack, 0.5, yappFrontLeft, yappFrontRight, yappBaseOnly]
    ];

// bottom venting
cutoutsBase =
[
    [32, 28, 50, 35, 0, yappRectangle, yappCenter, maskHoneycomb]
    ];

// HDMI and Power Ports
cutoutsLeft =
[
    [4, 6, 13, 7, 0, yappRectangle]         // USB-C Power
    ,[19, 6, 13, 8.75, 0, yappRectangle]    // HDMI-0
    ,[33, 6, 13, 8.75, 0, yappRectangle]    // HDMI-1
    ];

// Ethernet and USB Ports
cutoutsFront =
[
    [1, 6, 16.5, 14, 0, yappRectangle]      // Ethernet
    ,[21, 6, 14, 16, 0, yappRectangle]      // USB 3.0
    ,[39, 6, 14, 16, 0, yappRectangle]      // USB 2.0
    ];

// MicroSD Card Port
cutoutsBack =
[
    [21, 4, 17, 5, 0, yappRectangle]
    ];

// Snap Joins
snapJoins =
    [
        [80, 5, yappLeft, yappRight], [(shellWidth/2)-2.5, 5, yappBack]
    ];

tpl = 157;
tpw = 100;
tph = 19;
module back_plate()
{
    union() {
        difference() {
            cube([tpl, tpw, tph], center=true); // outer cube
            translate([1, 0, 2])
                cube([tpl-2, tpw-4, tph-2], center=true); // inner cube
            translate([tpl/2 - 2, 0 , 0])
                cube([10, tpw, tph], center=true); // cut off 10 cm lip
            translate([-(tpl/2) + 4, (tpw/2) - 7, -(tph/2)])
                cylinder(d=3, h=3); // top stand side standoff hole
            translate([-(tpl/2) + 4, (tpw/2) - 87, -(tph/2)])
                cylinder(d=3, h=3); // bottom stand side standoff hole
            translate([-(tpl/2) + 95, (tpw/2) - 37, -9])
              color("green") cube([pcbLength+7.5, pcbWidth+5.5, 8], center=true);  // Raspberry Pi
        }
        difference() {
            translate([tpl/2 - 4, 0 , -8.75])
                cube([10, tpw, 1.5], center=true); //  lip where cover connects to video side
            translate([-(tpl/2) + 154 , (tpw/2) - 7, -(tph/2)])
                cylinder(d=3, h=3); // pi side video top standoff hole
            translate([-(tpl/2) + 154 , (tpw/2) - 87, -(tph/2)])
                cylinder(d=3, h=3); // pi side video standoff hole
        }
        // PCB case base
        translate([tpl/2 - 14, -tpw/2 + 32 , 0])
            rotate([0, 180, 0])
                color("green")YAPPgenerate();
    }
}

module stand()
{
   $fn= 360;

    w = 70;       // width of rectangle
    h = 4;       // height of rectangle
    l = 50;      // length of chord of the curve
    dh = 6;           // delta height of the curve

    module curve(width, height, length, dh) {
        r = (pow(length/2, 2) + pow(dh, 2))/(2*dh);
        a = 2*asin((length/2)/r);
        translate([-(r -dh), 0, -width/2]) rotate([90, -90, 90])  rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [height, width], center = true);
    }

    curve(w, h, l, dh);
}


union()
    {
        back_plate();
        translate([40, -41, -27.25])
            stand();
    }

