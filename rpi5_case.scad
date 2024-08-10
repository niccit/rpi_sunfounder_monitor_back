$fa = 1;
$fs = 0.4;

include <YAPP_Box/YAPPgenerator_v3.scad>;

printBaseShell = true;
printLidShell = false;

pcbLength = 87.90;
pcbWidth = 56.89;
pcbThickness = 10.07;

paddingFront = 2;
paddingBack = 2;
paddingLeft = 1;
paddingRight = 0.5;

wallThickness = 2;

baseWallHeight = 23;
lidWallHeight = 7;

//-- C O N T R O L ---------------//-> Default -----------------------------
showSideBySide        = true;     //-> true
previewQuality        = 5;        //-> from 1 to 32, Default = 5
renderQuality         = 6;        //-> from 1 to 32, Default = 8
shiftLid              = 10;
colorLid              = "YellowGreen";
colorBase             = "BurlyWood";



cutoutsBack =
    [
        [38.75, 12.5, 16.19, 13.40, 0, yappRectangle],      // Ethernet
        [20.5, 13.25, 14.93, 15.87, 0, yappRectangle],        // USB-A High Speed
        [2.75, 13.25, 14.67, 15.87, 0, yappRectangle]       // USB-A

    ];

cutoutsRight = [
        [72, 11.5, 9.16, 3.6, 0, yappRectangle],                 // USB-C Power
        [58, 11.5, 7.7, 4.13, 0, yappRectangle],                 // HDMI0
        [44.5, 11.5, 7.7, 4.13, 0, yappRectangle]                // HDMI1
    ];

cutoutsFront = [
        [37.5, 12, 0, 0, 1.25, yappCircle],                     // Reset button
    ];

cutoutsBase = [
        [80, 3.68, 0, 0, 2.25, yappCircle],         // Left Front
        [80, 50, 0, 0, 2.25, yappCircle],           // Right Front
        [24.25, 3.68, 0, 0, 2.25, yappCircle],      // Left Rear
        [pcbLength/2, pcbWidth/2, 50, 2, yappCenter, yappRectangle],        // base vent center
        [pcbLength/2, pcbWidth/2 - 5, 50, 2, yappCenter, yappRectangle],    // base vent
        [pcbLength/2, pcbWidth/2 + 5, 50, 2, yappCenter, yappRectangle],    // base vent
        [pcbLength/2, pcbWidth/2 - 10, 50, 2, yappCenter, yappRectangle],   // base vent
        [pcbLength/2, pcbWidth/2 + 10, 50, 2, yappCenter, yappRectangle],   // base vent
    ];

cutoutsLid = [
        [pcbLength/2, pcbWidth/2, 2, 20, yappCenter, yappRectangle],            // lid vent center
        [pcbLength/2 - 5, pcbWidth/2, 2, 20, yappCenter, yappRectangle],        // lid vent
        [pcbLength/2 + 5, pcbWidth/2, 2, 20, yappCenter, yappRectangle],        // lid vent
        [pcbLength/2 - 15, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength/2 + 15, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength/2 - 25, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength/2 + 25, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength - 59, 3, 51, 5, 0, yappRectangle],                           // GPIO Pins
        [pcbLength - 58,  pcbWidth - 14, 11, 12, 0, yappRectangle],             // Cam/Disp 0/1
    ];




snapJoins =
    [
        [2, 5, yappLeft, yappRight], [(shellWidth/2)-2.5, 5, yappFront]
    ];


YAPPgenerate();