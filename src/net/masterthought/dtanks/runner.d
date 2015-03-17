module net.masterthought.dtanks.runner;

import net.masterthought.dtanks.match;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.guiwindow;
import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.gameresult;
import net.masterthought.dtanks.properties;

import std.stdio;

class Runner {

  private Match match;
  static Brain[] brains;
  Properties props;

  this(){
     props = Properties.all;
     this.match = new Match(Arena(props.arenaWidth,props.arenaHeight),props);
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

  if(props.headless){
     match.start();
   } else {
     GuiWindow gui = new GuiWindow(this.match);
     gui.execute();
   }

   GameResult result = new GameResult(match);
   result.display();

  }

}






