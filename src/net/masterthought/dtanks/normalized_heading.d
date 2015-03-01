module net.masterthought.dtanks.normalizedheading;

import net.masterthought.dtanks.heading;

import std.algorithm;
import std.math;
import std.stdio;
import std.conv;

import std.range;
import std.array;

class NormalizedHeading{

public Heading normalize(Heading currentHeading, Heading newHeading, real[] range, float maxDelta){
  return new Heading(enforceRange(range,enforceDelta(currentHeading, newHeading, maxDelta)));
}

private double enforceDelta(Heading currentHeading, Heading newHeading, float maxDelta){
  double currentDelta = this.delta(currentHeading, newHeading);
   if(currentDelta.abs > maxDelta){
      return currentDelta > 0 ? currentHeading.radians + maxDelta : currentHeading.radians - maxDelta;
   } else {
    return newHeading.radians;
   }
}

private double delta(Heading currentHeading, Heading newHeading){
  if(!isNaN(currentHeading.radians)){
      return currentHeading.delta(newHeading.radians);
    } else {
       return 0;
    }
}

private double enforceRange(real[] range, double value){
auto s = range.reduce!(min,max);
double min = s[0];
double max = s[1];
  if(min <= value && value <  max){
    return value;
  } else {
    return value > max ? max : min;
  }
}

}

//void main(){
//  double[] range = iota(-3.0,4.0).array;
//  double step = 0.05;
//  double speed = new NormalizedAttr().normalizeSpeed(2,3,range,step);

//  //bool res = canFind(range,2.5);
//  writeln(speed);

//}
