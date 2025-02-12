$fa = 1;
$fs = 0.4;

include <YAPP_Box/YAPPgenerator_v3.scad>;

printBaseShell = true;
printLidShell = true;

pcbLength = 87.90;
pcbWidth = 56.89;
pcbThickness = 10.07;

paddingFront = 1;
paddingBack = 1;
paddingTop = 0.5;

wallThickness = 2;
basePlaneThickness = 2.4;
lidPlaneThickness = 2.4;

// baseWallHeight = 34.5;
// lidWallHeight = 2;

baseWallHeight = 23;
lidWallHeight = 7;

//-- C O N T R O L ---------------//-> Default -----------------------------
showSideBySide        = true;     //-> true
previewQuality        = 5;        //-> from 1 to 32, Default = 5
renderQuality         = 6;        //-> from 1 to 32, Default = 8
onLidGap              = 3;
shiftLid              = 5;
colorLid              = "YellowGreen";
alphaLid              = 1;
colorBase             = "BurlyWood";
alphaBase             = 1;
hideLidWalls          = false;    //-> false
hideBaseWalls         = false;    //-> false
showOrientation       = true;
showPCB               = false;
showSwitches          = false;
showMarkersBoxOutside = false;
showMarkersBoxInside  = false;
showMarkersPCB        = false;
showMarkersCenter     = false;
inspectX              = 0;        //-> 0=none (>0 from Back)
inspectY              = 0;        //-> 0=none (>0 from Right)
inspectZ              = 0;        //-> 0=none (>0 from Bottom)
inspectXfromBack      = true;     //-> View from the inspection cut foreward
inspectYfromLeft      = true;     //-> View from the inspection cut to the right
inspectZfromTop       = false;    //-> View from the inspection cut down



cutoutsBack =
    [
        [37.25, 11.25, 16.19, 13.40, 0, yappRectangle],     // Ethernet
        [20, 11.25, 14.93, 15.87, 0, yappRectangle],        // USB-A High Speed
        [2.75, 11.25, 14.67, 15.87, 0, yappRectangle]       // USB-A

    ];

cutoutsRight = [
        [72, 12.5, 9.11, 3.45, 0, yappRectangle],       // USB-C Power
        [58, 12.5, 6.6, 3.71, 0, yappRectangle],        // HDMI0
        [45, 12.5, 6.6, 3.71, 0, yappRectangle]         // HDMI1
    ];

cutoutsFront = [
        [36, 12.2, 0, 0, 1.25, yappCircle]      // Reset button
    ];

// standoffHeight = 5;
// standoffDiameter = 3;
// standoffPinDiameter = 0;
// standoffHoleSlack = 0;

pcbStands =
[
    [10, 5, 5, default, 3, 0, 0, 0.5, yappBack, yappBaseOnly]
];

cutoutsBase = [
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
        [pcbLength/2 - 10, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength/2 + 10, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength/2 - 15, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength/2 + 15, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength/2 - 20, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
        [pcbLength/2 + 20, pcbWidth/2, 2, 20, yappCenter, yappRectangle],       // lid vent
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