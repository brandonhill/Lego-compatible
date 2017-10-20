// LEGO® compatible brick examples

include <Lego compatible brick.scad>;

/* comparison of original to modern

// original
lego_compatible_brick(x = 4, y = 2, z = 1, wall_thickness = 0);

// modern (less material)
translate([0, LEGO_UNIT_WIDTH * 3, 0])
lego_compatible_brick(x = 4, y = 2, z = 1);

//*/

//* assorted bricks

// 1x1x0 smooth
lego_compatible_brick(studs = false);

// 2x1x0 smooth
translate([LEGO_UNIT_WIDTH * 2, 0, 0])
lego_compatible_brick(x = 2, studs = false);

// 3x1x0 smooth
translate([LEGO_UNIT_WIDTH * 5, 0, 0])
lego_compatible_brick(x = 3, studs = false);

// 4x1x0 smooth
translate([LEGO_UNIT_WIDTH * 9, 0, 0])
lego_compatible_brick(x = 4, studs = false);

// 6x1x0 smooth
translate([LEGO_UNIT_WIDTH * 14, 0, 0])
lego_compatible_brick(x = 6, studs = false);

// 8x1x0 smooth
translate([LEGO_UNIT_WIDTH * 21, 0, 0])
lego_compatible_brick(x = 8, studs = false);

// 1x1x0
translate([0, LEGO_UNIT_WIDTH * 2, 0])
lego_compatible_brick();

// 2x1x0
translate([LEGO_UNIT_WIDTH * 2, LEGO_UNIT_WIDTH * 2, 0])
lego_compatible_brick(x = 2);

// 3x1x0
translate([LEGO_UNIT_WIDTH * 5, LEGO_UNIT_WIDTH * 2, 0])
lego_compatible_brick(x = 3);

// 4x1x0
translate([LEGO_UNIT_WIDTH * 9, LEGO_UNIT_WIDTH * 2, 0])
lego_compatible_brick(x = 4);

// 6x1x0
translate([LEGO_UNIT_WIDTH * 14, LEGO_UNIT_WIDTH * 2, 0])
lego_compatible_brick(x = 6);

// 8x1x0
translate([LEGO_UNIT_WIDTH * 21, LEGO_UNIT_WIDTH * 2, 0])
lego_compatible_brick(x = 8);

// 2x2x0
translate([LEGO_UNIT_WIDTH * 2, LEGO_UNIT_WIDTH * 4, 0])
lego_compatible_brick(x = 2, y = 2);

// 3x2x0
translate([LEGO_UNIT_WIDTH * 5, LEGO_UNIT_WIDTH * 4, 0])
lego_compatible_brick(x = 3, y = 2);

// 4x2x0
translate([LEGO_UNIT_WIDTH * 9, LEGO_UNIT_WIDTH * 4, 0])
lego_compatible_brick(x = 4, y = 2);

// 6x2x0
translate([LEGO_UNIT_WIDTH * 14, LEGO_UNIT_WIDTH * 4, 0])
lego_compatible_brick(x = 6, y = 2);

// 8x2x0
translate([LEGO_UNIT_WIDTH * 21, LEGO_UNIT_WIDTH * 4, 0])
lego_compatible_brick(x = 8, y = 2);

// 1x1x1
translate([0, LEGO_UNIT_WIDTH * 7, 0])
lego_compatible_brick(z = 1);

// 2x1x1
translate([LEGO_UNIT_WIDTH * 2, LEGO_UNIT_WIDTH * 7, 0])
lego_compatible_brick(x = 2, z = 1);

// 3x1x1
translate([LEGO_UNIT_WIDTH * 5, LEGO_UNIT_WIDTH * 7, 0])
lego_compatible_brick(x = 3, z = 1);

// 4x1x1
translate([LEGO_UNIT_WIDTH * 9, LEGO_UNIT_WIDTH * 7, 0])
lego_compatible_brick(x = 4, z = 1);

// 6x1x1
translate([LEGO_UNIT_WIDTH * 14, LEGO_UNIT_WIDTH * 7, 0])
lego_compatible_brick(x = 6, z = 1);

// 6x1x1
translate([LEGO_UNIT_WIDTH * 14, LEGO_UNIT_WIDTH * 7, 0])
lego_compatible_brick(x = 6, z = 1);

// 8x1x1
translate([LEGO_UNIT_WIDTH * 21, LEGO_UNIT_WIDTH * 7, 0])
lego_compatible_brick(x = 8, z = 1);

// 2x2x1
translate([LEGO_UNIT_WIDTH * 2, LEGO_UNIT_WIDTH * 9, 0])
lego_compatible_brick(x = 2, y = 2, z = 1);

// 3x2x1
translate([LEGO_UNIT_WIDTH * 5, LEGO_UNIT_WIDTH * 9, 0])
lego_compatible_brick(x = 3, y = 2, z = 1);

// 4x2x1
translate([LEGO_UNIT_WIDTH * 9, LEGO_UNIT_WIDTH * 9, 0])
lego_compatible_brick(x = 4, y = 2, z = 1);

// 6x2x1
translate([LEGO_UNIT_WIDTH * 14, LEGO_UNIT_WIDTH * 9, 0])
lego_compatible_brick(x = 6, y = 2, z = 1);

// 8x2x1
translate([LEGO_UNIT_WIDTH * 21, LEGO_UNIT_WIDTH * 9, 0])
lego_compatible_brick(x = 8, y = 2, z = 1);

// 20x10x0
translate([0, LEGO_UNIT_WIDTH * 12, 0])
lego_compatible_brick(x = 20, y = 10, z = 0);

//*/
