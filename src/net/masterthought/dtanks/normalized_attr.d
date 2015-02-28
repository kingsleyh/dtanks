module net.masterthought.dtanks.normalizedattr;

import std.algorithm;
import std.math;
import std.stdio;

class NormalizedAttr{

public float normalizeSpeed(float currentValue, float newValue, int[] speeds, float maxDelta){
  return enforceRange(speeds,enforceDelta(currentValue, newValue, maxDelta));
}

private float enforceDelta(float currentValue, float newValue, float maxDelta){
  float currentDelta = delta(currentValue, newValue);
   writeln("current delta: ", currentDelta, " max delta: ", maxDelta);
   writeln("cur val: ", currentValue, "new val: ", newValue);
   if(currentDelta.abs > maxDelta){
     return currentDelta > 0 ? currentValue + maxDelta : currentValue - maxDelta;
   } else {
    return newValue;
   }
}

private float delta(float currentValue, float newValue){
  if(currentValue){
      return newValue - currentValue;
    } else {
       return 0;
    }
}

private float enforceRange(int[] range, float value){
  if(canFind(range,value)){
    return value;
  } else {
    auto s = range.reduce!(min,max);
    return value > s[1] ? s[1] : s[0];
  }
}

}
