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

//import net.masterthought.dtanks.moveable;

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
  public int health;

  public int firePower;
  public int gunEnergy;

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
     this.health = 5;
     this.speed = 0;
     this.firePower = 0;
     this.heading  = new Heading();

     //this.radar = new Radar(this, this.heading.dup);
     this.turret = new Turret(this.heading.clone());
  }

 //mixin Moveable;

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

  //public void setFirePower(int value){
  //  this.firePower = value;
  //}

  public void reduceHealth(double reduceBy){
    this.health -= reduceBy;
  }

  public bool isDead(){
    return this.health <= 0;
  }

  public void adjustFirePower(){
    if(!this.gunEnergy){
      this.gunEnergy = 10;
    }
    if(this.gunEnergy <= 0){
      this.firePower = 0;
    } else {
      this.gunEnergy -= (this.firePower ^^ 1.5) * 10;
    }
    this.gunEnergy += 1;
    if(this.gunEnergy > 10){
      this.gunEnergy = 10; 
    }
  }

  public void tick(){
    this.ticks += 1;
    this.tickBrain();
    // update bot position
    this.position = this.position.move(this.heading.radians,this.speed,true);

    adjustFirePower();
  }

  public bool isFiring(){
    return this.firePower && this.firePower > 0;
  }

  public void setGuiWindow(Window window){
    this.guiWindow = window;
  }

  public void tickBrain(){
    executeCommand(brain.tick(sensors()));
  }

  public void executeCommand(Command command){
    writeln(command);
    
    if(command.heading){
      this.heading = command.heading;
    }
    
    if(command.turretHeading){
      this.turret.setHeading(command.turretHeading.radians);
    }

    if(!isNaN(command.speed)){
      this.speed = command.speed;
    }

    //if(command.firePower){
      this.firePower = command.firePower;
    //} 
  
  }

  public Sensor sensors(){
    Sensor sensor = Sensor();
    sensor.ticks = ticks;
    sensor.health  = health;
    sensor.speed = speed;
    sensor.position = position;
    sensor.heading = this.heading;
    sensor.turretHeading = turret.getHeading();
    sensor.guiWindow = guiWindow;
    return sensor;
    //return Sensor(this.ticks,this.health,this.speed,this.position,this.heading,this.turret.getHeading(),this.guiWindow);
  }
}
