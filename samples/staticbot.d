module net.masterthought.dtanks.samples.staticbot;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import dsfml.graphics;


import std.random;
import std.stdio;
import std.range;

class StaticBot : Brain {

   static this(){
     Brain.add(new StaticBot());
   }

  override public Command tick(Sensor sensors){
    return command;
  }

  override public string name(){
    return "static_tank";
  }

  override public string skin(){
    return "red";
  }

}
