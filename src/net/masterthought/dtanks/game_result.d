module net.masterthought.dtanks.gameresult;

import net.masterthought.dtanks.match;
import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.properties;
import net.masterthought.rainbow;
import std.stdio;
import std.algorithm;
import std.conv;

class GameResult{

 private Match match;
 private CoreBot[] bots;
 private Properties props;

  this(Match match){
     this.match = match;
     this.bots = match.bots;
     this.props = match.props;
  }

  public void display(){
    if(props.ansi){

     writeln("\n\n-------------------------------------------------".rainbow.cyan.onBlack);
     writeln("|".rainbow.cyan.onBlack, "\t\t\tResults".rainbow.magenta.bold.onBlack, "\t\t\t|".rainbow.cyan.onBlack);
     writeln("-------------------------------------------------".rainbow.cyan.onBlack);

     writeln("Ticks: ".rainbow.yellow.onBlack, to!string(match.ticks).rainbow.yellow.onBlack);
     writeln("Survivors:".rainbow.c11.onBlack);

     multiSort!("a.health > b.health")(bots);

     foreach(bot ; bots){
        writeln("\t",bot.brain.name.rainbow.cyan.onBlack, "\thealth:\t".rainbow.yellow.onBlack, to!string(bot.health).rainbow.green.onBlack);
     }

     writeln("\n\n");

      } else {

     writeln("\n\n-------------------------------------------------");
     writeln("|", "\t\t\tResults", "\t\t\t|");
     writeln("-------------------------------------------------");

     writeln("Ticks: ", to!string(match.ticks));
     writeln("Survivors:");

     multiSort!("a.health > b.health")(bots);

     foreach(bot ; bots){
        writeln("\t",bot.brain.name, "\thealth:\t", to!string(bot.health));
     }

     writeln("\n\n");
  }
}

}
