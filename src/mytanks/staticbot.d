module net.masterthought.dtanks.samples.staticbot;

import net.masterthought.dtanks.brainhelper;
import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.skincolor;
import net.masterthought.dtanks.bot.radar;
import dsfml.graphics;

import std.random;
import std.stdio;
import std.range;

class StaticBot : Brain {

  mixin BrainHelper;

  SkinColor skinColor = SkinColor.orange;

   static this(){
     Brain.add(new StaticBot());
   }

  override public Command tick(Sensor sensors){


  if(hasReflections){
    Reflection reflection = reflections.front;
   skinColor = SkinColor.green;
   command.radarHeading = reflection.heading;
   //command.turretHeading = sensors.radarHeading;
   command.heading = new Heading(reflection.heading.radians + Heading.ONE_DEGREE * 2);
   command.speed = 3;

  } else {
    command.speed = 0;
    command.radarHeading = currentRadarHeadingPlusDegrees(5);
    skinColor = SkinColor.orange;
  }

  //command.heading = reflection.heading;
  // command.radarHeading = reflection.heading;
  // command.turretHeading = reflection.heading;


    return command;
  }

  override public string name(){
    return "static_tank";
  }

  override public SkinColor skin(){
    return skinColor;
  }

}
