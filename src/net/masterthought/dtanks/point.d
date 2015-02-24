module net.masterthought.dtanks.point;

import std.random;
import std.math;
import std.conv;
import std.stdio;
import net.masterthought.dtanks.arena;

struct Point {

  float x;
  float y;
  Arena arena;

  public static Point rand(Arena arena){
    Point p =  Point(uniform(0,arena.width),uniform(0,arena.height),arena);
    writeln(p);
    return p;
  }

  public float pointDistance(Point a, Point b){
    return hypot(a.x - b.x, a.y - b.y);
  }

  public float distance(Point otherPoint){
    return pointDistance(this,otherPoint);
  }

 public bool equals(Point otherPoint){
   return this.x == otherPoint.x && this.y == otherPoint.y;
 }

 public bool withinRadius(Point otherPoint, int radius){
    return distance(otherPoint) <= radius;
 }

 public bool onTopWall(){
  return this.y >= this.arena.height;
 }

public bool onBottomWall(){
  return this.y <= 0;
}

public bool onLeftWall(){
  return this.x <= 0;
}

public bool onRightWall(){
  return this.x >= this.arena.width;
}

public bool onWall(){
  return onTopWall() || onBottomWall() || onRightWall() || onLeftWall();
}

public bool outsideArena(){
  return this.y > this.arena.height || this.y < 0 || this.x > this.arena.width || this.x < 0;
}

public Point move(float heading, float speed){
  auto x = (this.x + (sin(heading) * speed));
  auto y = (this.y + (cos(heading) * speed));
  Point point = Point(x,y,this.arena);
  point.bindToArena();
  return point;
}

public void bindToArena(){
  if(this.x < 0){
    this.x = 0.0;
  } else if(this.x > this.arena.width){
    this.x = to!float(this.arena.width);
  }
  if(this.y < 0){
    this.y = 0.0;
  } else if(this.y > this.arena.height){
     this.y = to!float(this.arena.height);
  }
}

//public Heading heading(Point otherPoint){
//  Heading.new_between_points(self, other_point)
//}



}
