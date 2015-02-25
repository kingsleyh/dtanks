module net.masterthought.dtanks.match;

import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.shell;
import net.masterthought.dtanks.point;

import std.stdio;

class Match {

 public Arena arena;
 private int maxTicks;
 private bool teams;
 public int ticks;
 private bool stopped;
 public CoreBot[] bots;
 public Shell[] shells;
 //public TickGroup bots;
 //public TickGroup shells;

 this(Arena arena){
    this.arena = arena;
    this.ticks = 0;
    this.stopped = false;
    this.bots = [];
 }

 public void setTeams(bool value){
    this.teams = value;
 }

 public bool maxTicksReached(){
  return this.maxTicks && this.ticks >= this.maxTicks;
 }

 public bool finished(){

  //return this.stopped || this.maxTicksReached || this.bots.count <= 1 ||
  //(this.teams && this.bots.map!(n => n.name).array.sort.uniq.array.size ==1);
  return false;
 }

 public void addBots(CoreBot[] bots){
    this.bots ~= bots;
 }

 public void start(){
   while(!this.finished){
    this.incrementTicks();
   }
 }

 public void stop(){
  this.stopped = true;
 }

//public void preShellTick(Shell shell){
//  shell.hits
//}

 private void post_bot_tick(CoreBot bot){
 if(bot.isFiring()){
        // shell starts life at the end of the turret
        Point shellPosition = bot.position.move(bot.turret.getHeading().radians, 28,true);
        this.shells ~= new Shell(bot, shellPosition, bot.turret.getHeading().clone, bot.firePower);
      }
    }

 public void incrementTicks(){
  writeln("ticking");

  //tick the shells
  foreach(shell ; this.shells){
    shell.tick();
  }

  //tick the bots
  foreach(bot ; this.bots){
    bot.tick();

    // post bot tick
    post_bot_tick(bot);

  }

 
 

  this.ticks += 1;
 }

}
