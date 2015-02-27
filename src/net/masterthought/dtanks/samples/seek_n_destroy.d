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

  //getRadarLock();

 //seekLock(sensors);

     if(getRadarLock(sensors)){
        destroyLock(lock, sensors);
     } else {
      seekLock(sensors);
     }


    return command;
  }

 public void destroyLock(Reflection reflection, Sensor sensors){

writeln("target: ", reflection.heading.toDegrees());

   command.heading = reflection.heading;
   command.radarHeading = reflection.heading;
   command.turretHeading = reflection.heading;
   command.speed = reflection.distance > 200 ? 2 : 2 / 2.0;
   if(reflection.heading.delta(sensors.turretHeading.radians).abs < TURRET_FIRE_RANGE){
    command.fire(reflection.distance > 200 ? 5 : 1);
   }
 }

  public void seekLock(Sensor sensors){
    writeln("seeking lock");
    if(sensors.position.onWall()){
      writeln("ON WALL--------------");
      desiredHeading = new Heading(sensors.heading.radians + Heading.ONE_DEGREE * 3);
    }
      command.radarHeading = new Heading(sensors.radar.heading.radians + Heading.ONE_DEGREE * 3);
    command.speed = 1;
    if(desiredHeading){
      command.heading = desiredHeading;
      command.turretHeading = desiredHeading;
    }
  }

  public bool getRadarLock(Sensor sensors){
    writeln("looking for bots: ", sensors.radar.getReflections());
    string lockedOnName;
    bool gotLock = false;
    if(lockedOnName){
      gotLock = true;
      Reflection[] res = sensors.radar.getReflections().filter!(r => r.name == lockedOnName).array;
      lock = res.empty ? sensors.radar.getReflections().front : res.front;
    } else {
      if(!sensors.radar.getReflections().empty){
             gotLock = true;
          lock =sensors.radar.getReflections().front;
        }
    }
    if(gotLock){
      writeln("here I am ");
      writeln("name: ", lock.name);
      lockedOnName = lock.name;
    }
    return gotLock;
  }

  override public string name(){
    return "Seek&Destroy";
  }

}
