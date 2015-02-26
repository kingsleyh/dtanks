module net.masterthought.dtanks.bot.radar;

import std.array;
import std.math;
import std.range;
import std.algorithm;
import std.conv;

import net.masterthought.dtanks.point;
import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.corebot;

struct Reflection{
  Heading heading;
  float distance;
  string name;

  public static Reflection newFromPoints(Point from, Point to){
    Reflection reflection = Reflection();
     reflection.heading = from.heading(to);
     reflection.distance = from.distance(to);
    return reflection;
  }

}

class Radar {

CoreBot bot;
Heading heading;
public Reflection[] reflections;

  this(CoreBot bot, Heading heading){
    this.bot = bot;
    this.heading = heading;
    this.reflections = [];
  }

  public Point position(){
    return this.bot.position;
  }

  public void setHeading(float value){
     this.heading = new Heading(value);
  }

  public bool isEmpty(){
    return this.reflections.empty;
  }

 public Radar scan(CoreBot[] bots){
  this.reflections = [];
  foreach(otherBot ; bots){
    if(canDetect(otherBot)){
      Reflection reflection = Reflection.newFromPoints(position(), otherBot.position);
      reflection.name = otherBot.getName();
      this.reflections ~= reflection;
    }
  }
  return this;
 }

public bool canDetect(CoreBot otherBot){
 float oneDegree = (PI / 180.0);
 float first = -(oneDegree * 10.0);
 float second = (oneDegree * 10.0);
 string[] r = iota(first,second,0.000001).array.map!(n => to!string(n)).array;
 float search = Heading.deltaBetweenPoints(position(),this.heading.radians,otherBot.position);
 return r.canFind(to!string(search));


}

}
