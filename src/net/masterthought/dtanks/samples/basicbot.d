module net.masterthought.dtanks.samples.basicbot;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import dsfml.graphics;

import std.random;
import std.stdio;
import std.range;

class BasicBot : Brain {

   this(Arena arena){
    super(arena);
   }

  override public Command tick(Sensor sensors){

 command.speed = 2;
 command.firePower = 1;

 if(sensors.ticks % 20 == 0){
  foreach(n ; iota(0,900)){
    command.turretHeading = new Heading(sensors.turretHeading.radians - Heading.ONE_DEGREE * 5);
  }
 }

 if(sensors.ticks % 100 == 0){
  command.heading = new Heading(Heading.S);
 }

  if(sensors.ticks % 110 == 0){
  command.heading = new Heading(Heading.N);
 }

   if(sensors.ticks % 300 == 0){
  command.heading = new Heading(Heading.W);
 }

   if(sensors.ticks % 500 == 0){
  command.heading = new Heading(Heading.E);
 }

    return command;
  }

  override public dstring name(){
    return "BasicBot";
  }

}
