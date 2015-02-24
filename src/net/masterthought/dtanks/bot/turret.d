module net.masterthought.dtanks.bot.turret;

import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.point;

class Turret{

private Heading heading;
private Arena arena;
private Point position;
private float speed;

 this(Heading heading){
   this.heading = heading;
 }

  public void tick(){
      updatePosition();
  }

public bool dead(){
  return false;
}

public Arena getArena(){
   return arena;
}

public void setArena(Arena arena){
  this.arena = arena;
}

public Point getPosition(){
  return position;
}

public void setPosition(Point position){
  this.position = position;
}

public bool boundToArena(){
  return true;
}

public void updatePosition(){
  this.position = this.position.move(this.heading.radians,this.speed);
}

public Heading getHeading(){
  return this.heading;
}

public void setHeading(float heading){
  this.heading = new Heading(heading);
}

public float getSpeed(){
  return this.speed;
}

public void setSpeed(float speed){
  this.speed = speed;
}

}
