# OpenSCAD LEGO® compatible parametric brick

A parametric OpenSCAD LEGO® compatible brick for 3D printing.

![3D printed LEGO compatible bricks](https://github.com/brandonhill/Lego-compatible/blob/master/img/render.png)

![3D printed LEGO compatible bricks - bottom view](https://github.com/brandonhill/Lego-compatible/blob/master/img/render-bottom.png)

## Usage:

```
use <../Lego-compatible/Lego compatible brick.scad>;

lego_compatible_brick(x = 4, y = 2, z = 1);
```

## Module parameters

Standard parameters:
* **x**: [int|1] units long
* **y**: [int|1] units wide
* **z**: [int|0] units high (traditionally 0 or 1)
* **studs**: [bool|true] Whether or not to render the studs (knobs). Default is true,

Material conservation parameters:
* **ridge_width**: [float|0.6] Width of stud contact ridges (applies when wall_thickness != 0)
* **wall_thickness**: [float|0.6] Thickness of side walls (pass 0 for default)
