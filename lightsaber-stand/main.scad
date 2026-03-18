
SUPPORT_GAP = 82;
BASE_WIDTH = 50;
BASE_LENGTH = 150;
BASE_THICKNESS = 4;
BASE_CORNER_CUT = 24;

SUPPORT_THICKNESS = BASE_THICKNESS;
SUPPORT_LENGTH = 12;
SUPPORT_HEIGHT = 30;

LIGHTSABER_RADIUS = 30/2;

module base_primitive() {
  cylinder(h=BASE_THICKNESS, r1=BASE_THICKNESS, r2=1, $fn=24);
}

module base() {
  difference() {
    hull() {
      translate([ BASE_LENGTH/2, 0, 0]) base_primitive();
      translate([-BASE_LENGTH/2, 0, 0]) base_primitive();
      translate([ BASE_LENGTH/2-BASE_CORNER_CUT,  BASE_WIDTH/2, 0]) base_primitive();
      translate([ BASE_LENGTH/2-BASE_CORNER_CUT, -BASE_WIDTH/2, 0]) base_primitive();
      translate([-BASE_LENGTH/2+BASE_CORNER_CUT,  BASE_WIDTH/2, 0]) base_primitive();
      translate([-BASE_LENGTH/2+BASE_CORNER_CUT, -BASE_WIDTH/2, 0]) base_primitive();
    }
    translate([ SUPPORT_GAP/2, 0, BASE_THICKNESS]) cube([SUPPORT_THICKNESS, SUPPORT_LENGTH, BASE_THICKNESS*2], center=true);
    translate([-SUPPORT_GAP/2, 0, BASE_THICKNESS]) cube([SUPPORT_THICKNESS, SUPPORT_LENGTH, BASE_THICKNESS*2], center=true);
  }
}

module support() {
  translate([0, -SUPPORT_LENGTH/2, 0]) cube([SUPPORT_HEIGHT, SUPPORT_LENGTH, SUPPORT_THICKNESS]);
  translate([SUPPORT_HEIGHT+LIGHTSABER_RADIUS, 0, 0]) rotate(135) rotate_extrude(convexity = 10, angle=90, $fn=64)
    translate([LIGHTSABER_RADIUS, 0, 0])
        square([4, SUPPORT_THICKNESS]);
}

base();
translate([0, 52, 0]) support();
translate([-SUPPORT_HEIGHT-LIGHTSABER_RADIUS, 52, 0]) support();

