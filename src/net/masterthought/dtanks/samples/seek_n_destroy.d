module net.masterthought.dtanks.samples.seekndestroy;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.bot.radar;
import dsfml.graphics;

import std.random;
import std.stdio;
import std.range;
import std.array;

class SeeknDestroy : Brain {

   this(Arena arena){
    super(arena);
   }

  enum TURRET_FIRE_RANGE = Heading.ONE_DEGREE * 5.0;
  Heading desiredHeading = null;
  Reflection lock;


  override public Command tick(Sensor sensors){

  getRadarLock();

 //seekLock();

     //if(getRadarLock()){
     //   destroyLock(lock);
     //} else {
     // seekLock();
     //}


    return command;
  }

 public void destroyLock(Reflection reflection){
   command.heading = reflection.heading;
   command.radarHeading = reflection.heading;
   command.turretHeading = reflection.heading;
   command.speed = reflection.distance > 200 ? 5 : 5 / 2.0;
   if(reflection.heading.delta(sensors.turretHeading.radians).abs < TURRET_FIRE_RANGE){
    command.fire(reflection.distance > 200 ? 5 : 1);
   }
 }

  public void seekLock(){
    if(sensors.position.onWall()){
      desiredHeading = new Heading(sensors.heading.radians + Heading.HALF_ANGLE);
    }
      //command.radarHeading = new Heading(sensors.radar.heading.radians + Heading.ONE_DEGREE * 3);
    command.speed = 1;
    if(desiredHeading){
      command.heading = desiredHeading;
      command.turretHeading = desiredHeading;
    }
  }

  public bool getRadarLock(){
    string lockedOnName;
    bool gotLock = false;
    if(lockedOnName){
      gotLock = true;
      Reflection[] res = sensors.radar.getReflections().filter!(r => r.name == lockedOnName).array;
      lock = res.empty ? sensors.radar.getReflections().front : res.front;
    } else {
      lock = sensors.radar.getReflections().front;
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
