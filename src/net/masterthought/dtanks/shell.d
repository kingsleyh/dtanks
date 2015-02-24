module net.masterthought.dtanks.shell;

import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.point;
import net.masterthought.dtanks.heading;

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

  public void hits(){
  // TO DO
  }

}
