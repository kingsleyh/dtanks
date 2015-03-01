module net.masterthought.dtanks.runner;

import net.masterthought.dtanks.match;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.guiwindow;
import net.masterthought.dtanks.bot.brain;

import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.samples.superbot;
import net.masterthought.dtanks.samples.basicbot;
import net.masterthought.dtanks.samples.seekndestroy;
import net.masterthought.dtanks.samples.staticbot;

class Runner {

  private Match match;

  this(int width, int height){
     this.match = new Match(Arena(width,height));
  }

  public void start(){
    //this.match.start();

addBots();

 GuiWindow gui = new GuiWindow(this.match);
   gui.execute();

//match.start();
  }

  public void addBots(){
    //Brain[] brains = [new SuperBot(this.match.arena),new BasicBot(this.match.arena), new SeeknDestroy(this.match.arena)];
    //Brain[] brains = [new SeeknDestroy(this.match.arena), new SeeknDestroy(this.match.arena)];
    Brain[] brains = [
    new StaticBot(this.match.arena,"black"),
    new StaticBot(this.match.arena,"blue"),
    new StaticBot(this.match.arena,"green"),
    new StaticBot(this.match.arena,"orange"),
    new StaticBot(this.match.arena,"pink"),
    new StaticBot(this.match.arena,"purple"),
    new StaticBot(this.match.arena,"purple2"),
    new StaticBot(this.match.arena,"red"),
    new StaticBot(this.match.arena,"white"),
    new StaticBot(this.match.arena,"yellow"),
    new SuperBot(this.match.arena),
     ];
    CoreBot[] bots = [];
    foreach(brain ; brains){
       bots ~= CoreBot.newRandomLocation(this.match.arena, brain);
    }
    this.match.addBots(bots);
  }

}






