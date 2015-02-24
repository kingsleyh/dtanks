module net.masterthought.dtanks.corebot;

import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.heading;

import net.masterthought.dtanks.point;
import net.masterthought.dtanks.bot.brain;
//import net.masterthought.dtanks.bot.radar;
import net.masterthought.dtanks.bot.turret;

import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;

import net.masterthought.dtanks.samples.superbot;

import dsfml.graphics;

import std.stdio;
import core.thread;
import std.math;

class CoreBot {

  private Arena arena;
  private Brain brain;
  //private Radar radar;
  public Turret turret;
  private int ticks;
  private int health;
  //private int firePower;
  //private int gunEnergy;

  private float speed;
  public Heading heading;
  public Point position;

  public Window guiWindow;

  this(Arena arena, Brain brain){
     this.arena = arena;
     //this.brain = new brainKlass(this.arena);
     this.brain = brain;
     this.ticks = 0;

     this.position = Point(0, 0, this.arena);
     this.health = 100;
     this.speed = 0;
     //this.fire_power = void;
     this.heading  = new Heading();

     //this.radar = new Radar(this, this.heading.dup);
     this.turret = new Turret(this.heading.clone());
  }



  public static CoreBot newRandomLocation(Arena arena, Brain brain){
     CoreBot bot = new CoreBot(arena,brain);
     bot.position = Point.rand(arena);
     Heading randHeading = Heading.rand();
     bot.heading = randHeading;
     bot.turret.setHeading(randHeading.radians);
     //core.thread.Thread.sleep( dur!("seconds")( 10 ) ); 
     return bot;
  }

  public dstring getName(){
    return this.brain.name();
  }

  public void setHealth(int value){
    this.health = value;
  }

  //public void firePower(int value){
  //  this.firePower =  value;
  //}

  //public void adjustFirePower(){
  //  this.gunEnergy = 100;
  //  if(this.gunEnergy <= 0){
  //     this.firePower = 0;
  //    } else {
  //      this.gunEnergy -= 1;
  //    }
  //    this.gunEnergy += 1;

  //    if(this.gunEnergy > 100){
  //      this.gunEnergy = 100
  //    }
  //}

  //public bool firing(){
  //  return this.firePower && this.firePower > 0;
  //}

  public void reduceHealth(int reduceBy){
    this.health -= reduceBy;
  }

  public bool dead(){
    return this.health <= 0;
  }

  public void tick(){
    writeln("ticking in corebot");
    this.ticks += 1;
    this.tickBrain();
    writeln("before pos: ", this.position);
    this.position = this.position.move(this.heading.radians,this.speed);
    writeln("after pos: ", this.position);
    //this.adjustFirePower;
  }

  public void setGuiWindow(Window window){
    this.guiWindow = window;
  }

  public void tickBrain(){
    writeln("ticking in tick brain");
    executeCommand(brain.tick(sensors()));
  }

  public void executeCommand(Command command){
    writeln("executing command");
    writeln(command);
    if(command.heading){
      writeln("in the heading");
       this.heading = command.heading;
     }
     if(command.turretHeading){
    this.turret.setHeading(command.turretHeading.radians);
     }
     if(!isNaN(command.speed)){
    this.speed = command.speed;
  }
    writeln("executed the command");
  }

  public Sensor sensors(){
    return Sensor(this.ticks,this.health,this.speed,this.position,this.heading,this.turret.getHeading(),this.guiWindow);
  }


}
