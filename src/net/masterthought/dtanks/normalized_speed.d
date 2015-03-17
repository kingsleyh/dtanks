module net.masterthought.dtanks.normalizedspeed;

import std.algorithm;
import std.math;
import std.stdio;
import std.conv;

import std.range;
import std.array;
import std.random;

class NormalizedSpeed{

public double normalize(double currentValue, double newValue, double[] speeds, double maxDelta){
  return enforceRange(speeds,enforceDelta(currentValue, newValue, maxDelta));
}

private double enforceDelta(double currentValue, double newValue, double maxDelta){
  double currentDelta = this.delta(currentValue, newValue);
   if(currentDelta.abs > maxDelta){
      return currentDelta > 0 ? currentValue + maxDelta : currentValue - maxDelta;
   } else {
    return newValue;
   }
}

private double delta(double currentValue, double newValue){
  if(!isNaN(currentValue)){
      return to!double(newValue) - to!double(currentValue);
    } else {
       return 0;
    }
}

private double enforceRange(double[] range, double value){
auto s = range.reduce!(min,max);
double min = s[0];
double max = s[1];

writeln("min: ", min);
writeln("max: ", max);

  if(min <= value && value <  max){
    writeln("first: ", value);
    return value;
  } else {
    writeln("second: ", value);
    return value >= max ? max : min;
  }
}

}

//void main(){

//  NormalizedSpeed ns = new NormalizedSpeed();



//    double r1 = 3;
//    double r2 = 3;

//    writeln("r1: ", r1);
//    writeln("r2: ", r2);

//    double s1 = ns.normalize(r1,r2,iota(-3.0,4.0).array,0.05);
//    double s2 = ns.normalize(s1,r2,iota(-3.0,4.0).array,0.05);
//    double s3 = ns.normalize(s2,r2,iota(-3.0,4.0).array,0.05);

//    writeln(s1);
//    writeln(s2);
//    writeln(s3);






//}
