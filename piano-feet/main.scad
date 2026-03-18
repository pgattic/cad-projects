
BAR_RADIUS = 25 / 2;
CLAMP_THICKNESS = 3.5;
LENGTH = 25;
WRAP_DEG = 240;
NUB_RADIUS = 12 / 2;

module main() {
  difference() {
    union() {
      rotate(-WRAP_DEG/2) rotate_extrude(convexity = 10, angle=WRAP_DEG, $fn=64)
        translate([BAR_RADIUS, 0, 0])
          square([CLAMP_THICKNESS, LENGTH]);
      translate([BAR_RADIUS, -20, 0]) cube([CLAMP_THICKNESS, 40, LENGTH]);
    }
    translate([0, 0, LENGTH/2]) rotate([0, 90, 0]) cylinder(CLAMP_THICKNESS+BAR_RADIUS, r=NUB_RADIUS);
  }
}

main();

