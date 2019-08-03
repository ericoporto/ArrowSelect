# ArrowSelect
Select things using arrows, module for in point and click games made with Adventure Game Studio 

## Implementation details

This is just the detail on how things works on this module

### Problem

By using keyboard arrow keys or joystick directional hat, select between clickable things on screen.

### Solution 

When the player press an arrow button do as follow:

1 .get the x,y position of each thing on screen,

2 .select only things on arrow button direction (example:at right of current cursor position, when player press right arrow button), 

3 .calculate distance from cursor to things there, and get what has the smaller distance 

### Solution details

For 2, the key is figuring out the right angle and then create a triangle that extends to screen border, the things inside the triangle can be figured with the function below

https://stackoverflow.com/a/9755252/965638
```
public static bool PointInTriangle(Point p, Point p0, Point p1, Point p2)
{
    var s = p0.Y * p2.X - p0.X * p2.Y + (p2.Y - p0.Y) * p.X + (p0.X - p2.X) * p.Y;
    var t = p0.X * p1.Y - p0.Y * p1.X + (p0.Y - p1.Y) * p.X + (p1.X - p0.X) * p.Y;

    if ((s < 0) != (t < 0))
        return false;

    var A = -p1.Y * p2.X + p0.Y * (p2.X - p1.X) + p0.X * (p1.Y - p2.Y) + p1.X * p2.Y;

    return A < 0 ?
            (s <= 0 && s + t >= A) :
            (s >= 0 && s + t <= A);
}
```
