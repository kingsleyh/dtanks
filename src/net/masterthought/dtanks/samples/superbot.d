module net.masterthought.dtanks.samples.superbot;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;

class SuperBot : Brain {

   this(Arena arena){
    super(arena);
   }

  override public void tick(){

  }

  override public dstring name(){
    return "SuperBot";
  }

}
