module net.masterthought.dtanks.match;

import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.shell;
import net.masterthought.dtanks.point;
import net.masterthought.dtanks.explosion;

import std.stdio;
import std.array;
import std.algorithm;

class Match {

 public Arena arena;
 private int maxTicks;
 private bool teams;
 public int ticks;
 private bool stopped;
 public CoreBot[] bots;
 public Shell[] shells;
 public Explosion[] explosions;

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
  return this.stopped || this.maxTicksReached() || this.bots.length <= 1;
  //return this.stopped || this.maxTicksReached || this.bots.count <= 1 ||
  //(this.teams && this.bots.map!(n => n.name).array.sort.uniq.array.size ==1);
  //return false;
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

 private void postBotTick(CoreBot bot){
   if(bot.isFiring()){
     // shell starts life at the end of the turret
     Point shellPosition = bot.position.move(bot.turret.heading.radians, 28,true);
     this.shells ~= new Shell(bot, shellPosition, bot.turret.heading.clone, bot.firePower);
    }
 }

private void preBotTick(CoreBot bot){
    CoreBot[] otherBots = bots.filter!(b => b != bot).array;
  bot.radar.scan(otherBots);
}

 //private void preShellTick(Shell shell){
 //   shell.hits(this.bots,this.explosions);
 //}



 public void incrementTicks(){

  //tick the shells
  foreach(shell ; this.shells){
    //preShellTick(shell);

    // dont return explosions for now - until figure out how to handle them better
    //this.explosions = shell.hits(this.bots,this.explosions);
    shell.hits(this.bots,this.explosions);


    shell.tick();
  }

  //tick the bots
  foreach(bot ; this.bots){
    preBotTick(bot);
    bot.tick();
    postBotTick(bot);
  }

  //tick the explosions
  foreach(explosion ; this.explosions){
    explosion.tick();
  }


  writeln("explosions: ", this.explosions);


  this.ticks += 1;
 }

}
