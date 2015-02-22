module net.masterthought.dtanks.runner;

import net.masterthought.dtanks.match;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.samples.superbot;

class Runner {

  private Match match;

  this(int width, int height){
     this.match = new Match(new Arena(width,height));
  }

  public void start(){
    this.match.start();
  }

  //public addBrainPath(string brainPath){

  //}

}






