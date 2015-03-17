module net.masterthought.dtanks.runner;

import net.masterthought.dtanks.match;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.guiwindow;
import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.corebot;

class Runner {

  private Match match;
  static Brain[] brains;

  this(int width, int height){
     this.match = new Match(Arena(width,height));
  }

public static addBrain(Brain brain){
  Runner.brains ~= brain;
}

  public void start(){

 CoreBot[] bots = [];
    foreach(brain ; Runner.brains){
       bots ~= CoreBot.newRandomLocation(this.match.arena, brain);
    }
    this.match.addBots(bots);

   GuiWindow gui = new GuiWindow(this.match);
   gui.execute();

  //match.start();
  }

}






