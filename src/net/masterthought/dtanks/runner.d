module net.masterthought.dtanks.runner;

import net.masterthought.dtanks.match;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.guiwindow;
import net.masterthought.dtanks.bot.brain;

import net.masterthought.dtanks.corebot;
//import net.masterthought.dtanks.samples.superbot;
//import net.masterthought.dtanks.samples.basicbot;
//import net.masterthought.dtanks.samples.seekndestroy;
//import net.masterthought.dtanks.samples.staticbot;

import std.stdio;
import std.file;
import std.conv;
import std.regex;
import std.string;
import std.array;

class Runner {

  private Match match;
  private string[] brainPaths;

  this(int width, int height, string[] brainPaths){
     this.match = new Match(Arena(width,height));
     brainPaths.popFront;
     writeln(brainPaths);
     this.brainPaths = brainPaths;
  }

  public void start(){
    //this.match.start();

addBots();

 GuiWindow gui = new GuiWindow(this.match);
   gui.execute();

//match.start();
  }

  public void addBots(){

Brain[] brains = [];

foreach(sb ; brainPaths){
  auto content = to!string(read(sb));

string[] lines = content.split("\n");


foreach(line ; lines){
  auto m = line.match(r"class(.+):.+Brain");
  if(m){
     string klass = m.captures[1].removechars(" ");
    writeln(klass);
     brains ~= mixin("new " ~ klass ~ "(this.match.arena)");
    break;
  }
}


}
//Brain bot = mixin("new SuperBot(this.match.arena)");

    //Brain[] brains = [new SuperBot(this.match.arena),new BasicBot(this.match.arena), new SeeknDestroy(this.match.arena)];
    //Brain[] brains = [new SeeknDestroy(this.match.arena), new SeeknDestroy(this.match.arena)];
    //Brain[] brains = [
    //bot
    //new SeeknDestroy(this.match.arena,"black"),
    //new SeeknDestroy(this.match.arena,"blue"),
    //new SeeknDestroy(this.match.arena,"green"),
    //new SeeknDestroy(this.match.arena,"orange"),
    //new SeeknDestroy(this.match.arena,"pink"),
    //new SeeknDestroy(this.match.arena,"purple"),
    //new SeeknDestroy(this.match.arena,"purple2"),
    //new StaticBot(this.match.arena,"red"),
    //new SeeknDestroy(this.match.arena,"white"),
    //new StaticBot(this.match.arena,"yellow"),
    //new SuperBot(this.match.arena)
    // new SeeknDestroy(this.match.arena,"black"),
    //new SeeknDestroy(this.match.arena,"blue"),
    //new SeeknDestroy(this.match.arena,"green"),
    //new SeeknDestroy(this.match.arena,"orange"),
    //new SeeknDestroy(this.match.arena,"pink"),
    //new SeeknDestroy(this.match.arena,"purple"),
    //new SeeknDestroy(this.match.arena,"purple2"),
    //new StaticBot(this.match.arena,"red"),
    //new SeeknDestroy(this.match.arena,"white"),
    //new StaticBot(this.match.arena,"yellow"),
     //];
    CoreBot[] bots = [];
    foreach(brain ; brains){
       bots ~= CoreBot.newRandomLocation(this.match.arena, brain);
    }
    this.match.addBots(bots);
  }

}






