module net.masterthought.dtanks.samples.seekndestroy;


import net.masterthought.dtanks.brainhelper;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.bot.radar;
import net.masterthought.dtanks.skincolor;
import dsfml.graphics;

import std.random;
import std.stdio;
import std.range;
import std.array;

class SeeknDestroy : Brain {

  mixin BrainHelper;

  static this(){
     Brain.add(new SeeknDestroy());
   }

  enum TURRET_FIRE_RANGE = Heading.ONE_DEGREE * 5.0;
  Heading desiredHeading = null;
  Reflection lock;


  override public Command tick(Sensor sensors){
     if(getRadarLock(sensors)){
        destroyLock(lock, sensors);
     } else {
      seekLock(sensors);
     }
    return command;
  }

 public void destroyLock(Reflection reflection, Sensor sensors){
   command.heading = reflection.heading;
   command.radarHeading = reflection.heading;
   command.turretHeading = reflection.heading;
   command.speed = reflection.distance > 200 ? 2 : 2 / 2.0;

   writeln("refletion delta: ",reflection.heading.delta(sensors.turretHeading.radians).abs);

   if((reflection.heading.delta(sensors.turretHeading.radians)).abs < TURRET_FIRE_RANGE){
    command.fire(reflection.distance > 200 ? 5 : 1);
   }
 }

  public void seekLock(Sensor sensors){
    if(isOnWall){
      desiredHeading = currentHeadingPlusDegrees(2);
    }
      command.radarHeading = currentRadarHeadingPlusDegrees(3);
    command.speed = 1;
    if(desiredHeading){
      command.heading = desiredHeading;
      command.turretHeading = desiredHeading;
    }
  }

  public bool getRadarLock(Sensor sensors){
    string lockedOnName;
    bool gotLock = false;
    if(lockedOnName){
      gotLock = true;
      Reflection[] res = findReflectionByName(lockedOnName);
      lock = res.empty ? reflections.front : res.front;
    } else {
      if(hasReflections){
             gotLock = true;
          lock = reflections.front;
        }
    }
    if(gotLock){
      lockedOnName = lock.name;
    }
    return gotLock;
  }

  override public string name(){
    return "Seek&Destroy";
  }

}
