module net.masterthought.dtanks.samples.basicbot;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import dsfml.graphics;

import std.random;
import std.stdio;

class BasicBot : Brain {

   this(Arena arena){
    super(arena);
   }

  override public Command tick(Sensor sensors){

 command.speed = 2;

 if(sensors.ticks % 100 == 0){
  command.heading = new Heading(Heading.S);
 }

  if(sensors.ticks % 110 == 0){
  command.heading = new Heading(Heading.N);
 }

   if(sensors.ticks % 300 == 0){
  command.heading = new Heading(Heading.W);
 }


    return command;
  }

  override public dstring name(){
    return "BasicBot";
  }

}
