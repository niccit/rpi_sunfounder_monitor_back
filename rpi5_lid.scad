$fa = 1;
$fs = 0.4;

include <YAPP_Box/YAPPgenerator_v3.scad>;

printBaseShell = false;
printLidShell = true;

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
lidWallHeight = 11;

standoffHeight = 5;
standoffDiameter = 5;
standoffPinDiameter = 0;
standoffHoleSlack = 0;

// standoffs
pcbStands =
    [   [5, 5, 13, default, standoffDiameter, standoffPinDiameter, standoffHoleSlack, 0.5, yappBackLeft, yappBackRight, yappLidOnly]
    ,[22, 5, 13, default, standoffDiameter, standoffPinDiameter, standoffHoleSlack, 0.5, yappFrontLeft, yappFrontRight, yappLidOnly]
    ];

// Top cutouts for GPIO, Fan, Camera, venting
cutoutsLid =
    [
        [34, 20, 0, 0, 10, yappCircle]  // Cooling fan
        ,[8, 50, 48, 6, 0, yappRectangle]   //GPIO
        ,[48, 5, 12, 12, 0, yappRectangle] //Camera
        ,[8, 5, 20, 40, 4, yappRoundedRect, maskCircles]
        ,[65, 8, 20, 40, 4, yappRoundedRect, maskCircles]
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


YAPPgenerate();
