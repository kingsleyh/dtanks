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
  if(min <= value && value <  max){
    return value;
  } else {
    return value >= max ? max : min;
  }
}

}

