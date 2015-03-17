module net.masterthought.dtanks.gameresult;

import net.masterthought.dtanks.match;
import net.masterthought.dtanks.corebot;
import std.stdio;
import std.algorithm;

class GameResult{

 private Match match;
 private CoreBot[] bots;

  this(Match match){
     this.match = match;
     this.bots = match.bots;
  }

  public void display(){
     writeln("-------------------------------------------------------");
     writeln("Results");
     writeln("-------------------------------------------------------");
     writeln("");

     writeln("Ticks: ", match.ticks);
     writeln("Survivors");

     multiSort!("a.health > b.health")(bots);

     foreach(bot ; bots){
        writeln(bot.brain.name, " health: ", bot.health);
     }
  }

}
