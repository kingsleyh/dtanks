module net.masterthought.dtanks.explosion;

import std.conv;

import net.masterthought.dtanks.point;

class Explosion {

  enum LIFE_SPAN = (70 * 1);
  Point position;
  int ticks;

  this(Point position){
    this.position = position;
    this.ticks = 0;
  }
   
  public void setTicks(int ticks){
    this.ticks = ticks;
  } 

  public float percentDead(){
    return this.ticks / LIFE_SPAN;
  }

  public void tick(){
    this.ticks += 1;
  }

  public bool isDead(){
    return this.ticks > LIFE_SPAN;
  }


}
