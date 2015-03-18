module net.masterthought.dtanks.samples.camper;

import net.masterthought.dtanks.brainhelper;
import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.skincolor;
import net.masterthought.dtanks.bot.radar;
import net.masterthought.dtanks.point;
import dsfml.graphics;

import std.random;
import std.array;
import std.range;
import std.stdio;

class Camper : Brain {

 mixin BrainHelper;

 enum TURRET_FIRE_RANGE = Heading.ONE_DEGREE * 1.0;

   static this(){
     Brain.add(new Camper());
   }

  override public Command tick(Sensor sensors){
    hideInCorners();
    //Reflection[] targets = nearestTarget(sensors);

    return command;
  }

// public fireUpon(){

// }

// public nearestTarget(Sensor sensors){

// }

//public detectTargets(){

//}

public void hideInCorners(){

Point[] corners = [
  Point(sensors.arena.width,0,sensors.arena),
  Point(sensors.arena.width, sensors.arena.height, sensors.arena),
  Point(0,sensors.arena.height, sensors.arena),
  Point(0,0,sensors.arena)
];

  if(reachedTickInterval(600)){
    moveToCorner(randomSample(corners,1).front);
  }
}

public void moveToCorner(Point corner){
 command.speed = maxSpeed;
 command.heading = sensors.position.heading(corner);
}

  override public string name(){
    return "Camper";
  }

  override public SkinColor skin(){
    return SkinColor.yellow;
  }

}
