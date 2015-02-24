module net.masterthought.dtanks.samples.superbot;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;

class SuperBot : Brain {

   this(Arena arena){
    super(arena);
   }

  override public Command tick(Sensor sensors){
    command.speed = 10;
    command.heading = new Heading(Heading.ONE_DEGREE * 10);
    return command;
  }

  override public dstring name(){
    return "SuperBot";
  }

}
