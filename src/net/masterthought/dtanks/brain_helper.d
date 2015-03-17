module net.masterthought.dtanks.brainhelper;

mixin template BrainHelper(){

import std.random;
import std.stdio;
import std.range;
import std.array;

import net.masterthought.dtanks.configuration;

 int botRadius =  Configuration().bot().radius;
 int maxHealth = Configuration().bot().health[$-1];
 float maxSpeed = Configuration().bot().speed[$-1];
 int maxFirePower = Configuration().bot().firePower[$-1];
 int minFirePower = Configuration().bot().firePower.front;

@property public bool hasReflections(){
  return !sensors.radar.getReflections().empty;
}

@property public bool hasNoReflections(){
  return sensors.radar.getReflections().empty;
}

@property public Reflection[] reflections(){
    return sensors.radar.getReflections();
 }

public Reflection[] findReflectionByName(string name){
  return  sensors.radar.getReflections().filter!(r => r.name == name).array;
}

public Heading currentHeadingPlusDegrees(int value){
  return new Heading(sensors.heading.radians + Heading.ONE_DEGREE * value);
}

public Heading currentRadarHeadingPlusDegrees(int value){
  return new Heading(sensors.radar.heading.radians + Heading.ONE_DEGREE * value);
}

public Heading currentTurretHeadingPlusDegrees(int value){
  return new Heading(sensors.turretHeading.radians + Heading.ONE_DEGREE * value);
}

@property public bool isOnWall(){
  return sensors.position.onWall();
}


}
