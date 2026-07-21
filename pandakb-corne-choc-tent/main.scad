
CASE_LENGTH = 139.326;
BRACKET_HEIGHT = 30;

module case() {
  import("case.stl");
}

// 116, 104
// 118.372, 105.839

module pfilled_case() {
  union() {
    case();
    translate([28, 7, 1.5]) rotate([0, 0, 30]) cube([7, 2.5, 8.9]);
  }
}

module brackets() {
  difference() {
    union() {
      cube([10, 4, 12]);
      translate([0, 85.5, 0]) cube([10, 3, 12]);
      translate([0, 0, -6]) cube([10, 88.5, 6]);
      translate([5, 5, -BRACKET_HEIGHT]) cylinder(BRACKET_HEIGHT, r=5, $fn=48);
      translate([5, 85.5 - 2, -BRACKET_HEIGHT * (116 / 104)]) cylinder(BRACKET_HEIGHT, r=5, $fn=48);
    }
    union() {
      translate([5, 5, -BRACKET_HEIGHT]) cylinder(1, r=4, $fn=48);
      translate([5, 85.5 - 2, -BRACKET_HEIGHT * (116 / 104)]) cylinder(1, r=4, $fn=48);
    }
  }
}

module main() {
  difference() {
    rotate([0, 0, 7.5]) translate([29, 1, 0]) brackets();
    pfilled_case();
    translate([15, 89, 2.9]) cube([5, 5, 15]);
  }
}

main();
