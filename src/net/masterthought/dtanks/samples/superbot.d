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
    command.speed = 3;
    command.heading = new Heading(Heading.NE);
    command.turretHeading = new Heading(Heading.N);
    return command;
  }

  override public dstring name(){
    return "SuperBot";
  }

}
