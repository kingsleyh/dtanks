module net.masterthought.dtanks.samples.tracknshoot;

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

class TrackNShoot : Brain {

  mixin BrainHelper;

  SkinColor skinColor = SkinColor.orange;

   static this(){
     Brain.add(new TrackNShoot());
   }

  override public Command tick(Sensor sensors){


  if(hasReflections){
    Reflection reflection = reflections.front;
   skinColor = SkinColor.green;
   command.radarHeading = reflection.heading;
   command.turretHeading = reflection.heading;
   command.heading = new Heading(reflection.heading.radians);
   command.speed = 3;
   if(reflection.distance < 200){
     command.speed = 0;
     command.firePower = 1;
   }
  } else {
    command.speed = 0;
    command.firePower = 0;
    command.radarHeading = currentRadarHeadingPlusDegrees(5);
    skinColor = SkinColor.orange;
  }

    return command;
  }

  override public string name(){
    return "Track & Shoot";
  }

  override public SkinColor skin(){
    return skinColor;
  }

}
