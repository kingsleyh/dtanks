module net.masterthought.dtanks.heading;

import std.math;
import std.range;
import std.conv;
import std.random;

import net.masterthought.dtanks.point;

class Heading{

enum FULL_ANGLE = PI * 2.0;
enum HALF_ANGLE = PI;
enum EIGHTH_ANGLE = PI / 4.0;
enum ONE_DEGREE = FULL_ANGLE / 360.0;
enum FULL_RANGE =  iota(0,FULL_ANGLE);

enum NORTH = 0.0;
alias NORTH N;
enum NORTH_EAST = 1.0 * EIGHTH_ANGLE;
alias NORTH_EAST NE;
enum EAST = 2.0 * EIGHTH_ANGLE;
alias EAST E;
enum SOUTH_EAST = 3.0 * EIGHTH_ANGLE;
alias SOUTH_EAST SE;
enum SOUTH = 4.0 * EIGHTH_ANGLE;
alias SOUTH S;
enum SOUTH_WEST = 5.0 * EIGHTH_ANGLE;
alias SOUTH_WEST SW;
enum WEST = 6.0 * EIGHTH_ANGLE;
alias WEST W;
enum NORTH_WEST = 7.0 * EIGHTH_ANGLE;
alias NORTH_WEST NW;

public float radians;

public static Heading newFromDegrees(float degrees){
  return new Heading((degrees / 180.0) * PI);
}

public static Heading newBetweenPoints(Point from, Point to){
 return new Heading(from == to ? 0.0 : atan2(to.x - from.x, to.y - from.y));
}

public static float deltaBetweenPoints(Point from, float fromHeading, Point to){
  Heading relativeHeading = newBetweenPoints(from,to);
  return new Heading(fromHeading).delta(relativeHeading.radians);
}

public static float rand(){
  return uniform(0.0,0.9) * FULL_ANGLE;
}

this(float radians){
  this.radians = radians % FULL_ANGLE;
}

this(){
  this.radians = to!float(NORTH) % FULL_ANGLE;
}

public float delta(float to){
  float diff = (to = this.radians).abs % FULL_ANGLE;
  if(diff > PI){
    diff = -(FULL_ANGLE - diff);
  }
  return to < this.radians ? -diff : diff;
}

public Heading clone(){
  return new Heading(this.radians);
}

public bool equals(Heading otherHeading){
  return this.radians == otherHeading.radians;
}

public float toDegrees(){
  return (this.radians * 180.0) / PI;
}

}
