
LID_RADIUS = 60/2; // INTERNAL
LID_HEIGHT = 8; // INTERNAL
LID_THICKNESS = 1.5;

NETPOT_RADIUS = 36.5/2;

module main() {
  difference() {
    cylinder(LID_HEIGHT+LID_THICKNESS, r = LID_RADIUS+LID_THICKNESS, $fn=128);
    cylinder(LID_HEIGHT, r = LID_RADIUS, $fn=128);
    cylinder(LID_HEIGHT+LID_THICKNESS, r = NETPOT_RADIUS, $fn=128);
  };
}

main();

