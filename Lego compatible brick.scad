/***
 * LEGO® compatible brick
 */

include <_conf.scad>;

module lego_braces(x, y, z) {

	l = x * LEGO_UNIT_WIDTH;
	w = y * LEGO_UNIT_WIDTH;
	h = z ? z * LEGO_UNIT_HEIGHT * LEGO_UNITS_Z_PER_BLOCK : LEGO_UNIT_HEIGHT;

	alternate = min(x, y) > 1 && max(x, y) > 3;

	module wall() {
		translate([
			-LEGO_PIN_POST_BRACE_THICKNESS / 2,
			(x < y ? l : w) / -2,
			LEGO_PIN_POST_BRACE_INSET
		])
		cube([
			LEGO_PIN_POST_BRACE_THICKNESS,
			x < y ? l : w,
			h - LEGO_PIN_POST_BRACE_INSET
		]);
	}

	if (z && ((min(x, y) == 1 && max(x, y) > 1) || max(x, y) > 2)) {

		intersection() {
			lego_cube(x, y, z);
			difference() {
				union() {
					for (i = [1 : max(x, y) - 1]) {
						if (!alternate || i % 2 == 0) {
							translate([
								x < y ? l / 2 : i * LEGO_UNIT_WIDTH,
								x < y ? i * LEGO_UNIT_WIDTH : w / 2,
								0
							])
							rotate([0, 0, x < y ? -90 : 0])
							wall();
						}
					}
				}

				lego_internals(x, y, z, true);
			}
		}
	}
}

module lego_cavity(x, y, z, wall_thickness = LEGO_WALL_THICKNESS) {
	translate([wall_thickness, wall_thickness, -1])
	cube([
		x * LEGO_UNIT_WIDTH - (wall_thickness * 2),
		y * LEGO_UNIT_WIDTH - (wall_thickness * 2),
		(z ? z * LEGO_UNIT_HEIGHT * LEGO_UNITS_Z_PER_BLOCK : LEGO_UNIT_HEIGHT) - wall_thickness + 1
	]);
}

module lego_compatible_brick(

		// units long
		x = 1,

		// units wide
		y = 1,

		// units high (typically 0 or 1)
		z = 0,

		// studded or flat
		studs = true,

		// material conservation - thinner walls, using ridges for stud contact
		ridge_width = 0.6,
		wall_thickness = 0.6 // pass 0 for default
	) {

	// defaults
	wall_thickness = wall_thickness ? min(LEGO_WALL_THICKNESS, wall_thickness) : LEGO_WALL_THICKNESS;

	// assemble
	union() {

		// brick hull
		difference() {
			lego_cube(x, y, z);
			lego_cavity(x, y, z, wall_thickness);
		}

		// flat/studs
		if (studs) {
			lego_studs(x, y, z, wall_thickness);
		}

		// (internal) ridges
		lego_ridges(x, y, z, ridge_width, wall_thickness);

		// pins/posts
		lego_internals(x, y, z);

		// pin/post bracing
		lego_braces(x, y, z);
	}
}

module lego_cube(x, y, z) {
	translate([LEGO_WIDTH_SPACING / 2, LEGO_WIDTH_SPACING / 2, 0])
	cube([
		x * LEGO_UNIT_WIDTH - LEGO_WIDTH_SPACING,
		y * LEGO_UNIT_WIDTH - LEGO_WIDTH_SPACING,
		z ? z * LEGO_UNIT_HEIGHT * LEGO_UNITS_Z_PER_BLOCK : LEGO_UNIT_HEIGHT
	]);
}

module lego_internals(x, y, z, bounds) {

	inset = LEGO_UNIT_WIDTH;

	// posts
	if (y > 1 && x > 1) {
		for (i = [0 : x - 2], j = [0 : y - 2]) {
			translate([
				i * LEGO_UNIT_WIDTH + inset,
				j * LEGO_UNIT_WIDTH + inset,
				0])
			lego_post(z, bounds);
		}

	// pins
	} else if ((y > 1 || x > 1)) {
		for (i = [1 : max(x, y) - 1], j = [0 : y]) {
			translate([
				x > 1 ? i * LEGO_UNIT_WIDTH : x * LEGO_UNIT_WIDTH / 2,
				y > 1 ? j * LEGO_UNIT_WIDTH : y * LEGO_UNIT_WIDTH / 2,
				0
			])
			lego_pin(z, bounds);
		}
	}
}

module lego_pin(z, bounds) {

	$fs = 0.1;

	h = z ? z * LEGO_UNIT_HEIGHT * LEGO_UNITS_Z_PER_BLOCK : LEGO_UNIT_HEIGHT;

	difference() {

		cylinder(h - LEGO_WALL_THICKNESS, r = (LEGO_UNIT_WIDTH - LEGO_STUD_DIAMETER) / 2);

		if (!bounds) {
			translate([0, 0, -1])
			cylinder(h + 2, r = (LEGO_UNIT_WIDTH - LEGO_STUD_DIAMETER - LEGO_POST_WALL_THICKNESS * 2) / 2);
		}
	}
}

module lego_post(z, bounds) {

	h = z ? z * LEGO_UNIT_HEIGHT * LEGO_UNITS_Z_PER_BLOCK : LEGO_UNIT_HEIGHT;

	difference() {

		cylinder(h - LEGO_WALL_THICKNESS, r = LEGO_POST_DIAMETER / 2, $fs = 0.1);

		if (!bounds) {
			translate([0, 0, -1])
			cylinder(h + 2, r = (LEGO_POST_DIAMETER - LEGO_POST_WALL_THICKNESS * 2) / 2, $fs = 1);
		}
	}
}

module lego_ridges(x, y, z, width, wall_thickness) {

	l = x * LEGO_UNIT_WIDTH;
	w = y * LEGO_UNIT_WIDTH;
	h = z ? z * LEGO_UNIT_HEIGHT * LEGO_UNITS_Z_PER_BLOCK : LEGO_UNIT_HEIGHT;

	depth = LEGO_WALL_THICKNESS - wall_thickness;
	inset = LEGO_UNIT_WIDTH / 2;

	module ridge() {
		translate([-width / 2, 0, 0])
		cube([width, depth, h]);
	}

	for (i = [0 : x - 1], j = [0 : y - 1]) {
		translate([
			i * LEGO_UNIT_WIDTH + inset,
			LEGO_WALL_THICKNESS - depth,
			0
		])
		ridge();

		translate([
			i * LEGO_UNIT_WIDTH + inset,
			w - LEGO_WALL_THICKNESS,
			0
		])
		ridge();

		translate([
			LEGO_WALL_THICKNESS,
			j * LEGO_UNIT_WIDTH + inset,
			0
		])
		rotate([0, 0, 90])
		ridge();

		translate([
			l - LEGO_WALL_THICKNESS + depth,
			j * LEGO_UNIT_WIDTH + inset,
			0
		])
		rotate([0, 0, 90])
		ridge();
	}
}

module lego_stud(wall_thickness) {
	difference() {
		cylinder(LEGO_STUD_HEIGHT, r = LEGO_STUD_DIAMETER / 2 , $fs = 0.1);
		if (wall_thickness) {
			translate([0, 0, -1])
			cylinder(LEGO_STUD_HEIGHT - wall_thickness + 1, r = LEGO_STUD_DIAMETER / 2 - wall_thickness, $fs = 1);
		}
	}
}

module lego_studs(x, y, z, wall_thickness) {

	inset = LEGO_UNIT_WIDTH / 2;

	for (i = [0 : x - 1], j = [0 : y - 1]) {
		translate([
			i * LEGO_UNIT_WIDTH + inset,
			j * LEGO_UNIT_WIDTH + inset,
			z ? z * LEGO_UNIT_HEIGHT * LEGO_UNITS_Z_PER_BLOCK : LEGO_UNIT_HEIGHT
		])
		lego_stud(wall_thickness);
	}
}
