module net.masterthought.dtanks.shell;

import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.point;
import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.explosion;

import std.algorithm;
import std.array;
import std.conv;
import std.stdio;

class Shell{

  CoreBot bot;
  Arena arena;
  float firePower;
  Point position;
  Heading heading;
  float speed;
  bool dead;

  this(CoreBot bot, Point position, Heading heading, float firePower){
    this.bot = bot;
    this.position =  position;
    this.heading = heading;
    this.firePower = firePower;
    this.speed = Shell.setSpeed(this.firePower);
    this.dead = false;
  }

  public static float setSpeed(float power){
    return power * 4.5;
  }

  public bool isDead(){
    return this.dead || this.position.outsideArena();
  }

  public void setDead(){
    this.dead = true;
  }

  public Explosion[] hits(CoreBot[] bots, Explosion[] explosions){
   CoreBot[] otherBots = bots.filter!(b => b != this.bot).array;
   foreach(bot ; otherBots){
    if(bot.position.withinRadius(this.position, 19)){
      this.setDead();
      double damage = this.firePower ^^ 1.4;
      bot.reduceHealth(damage);
      if(bot.isDead()){
        explosions ~= new Explosion(bot.position);
      }
    }
   }
   return explosions;
  }

 //shell.hits(self.bots.all_but(shell.bot)) do |origin_bot, bot_hit|
 //       damage = (shell.fire_power**RTanque::Shell::RATIO)
 //       bot_hit.reduce_health(damage)
 //       if bot_hit.dead?
 //         @explosions.add(Explosion.new(bot_hit.position))
 //       end
 //     end


  public void tick(){
    this.position = this.position.move(this.heading.radians,this.speed,false);
  }

}
