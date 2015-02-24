module net.masterthought.dtanks.samples.superbot;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;

import std.random;

class SuperBot : Brain {

   this(Arena arena){
    super(arena);
   }

  override public Command tick(Sensor sensors){
    command.speed = 1;
    command.heading = new Heading(Heading.N);
    command.turretHeading = new Heading(Heading.S);
    return command;
  }

  override public dstring name(){
    return "SuperBot";
  }

}
