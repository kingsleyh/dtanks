module net.masterthought.dtanks.match;

import net.masterthought.dtanks.tickgroup;
import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.shell;

import std.stdio;

class Match {

 public Arena arena;
 private int maxTicks;
 private bool teams;
 public int ticks;
 private bool stopped;
 public TickGroup bots;
 public TickGroup shells;

 this(Arena arena){
    this.arena = arena;
    this.ticks = 0;
    this.stopped = false;
    this.bots = new TickGroup();
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
    this.bots.add(bots);
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

 public void incrementTicks(){
  writeln("ticking");
  //this.shells.tick();
  this.bots.tick();
  this.ticks += 1;
 }

}
