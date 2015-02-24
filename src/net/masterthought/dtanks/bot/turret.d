module net.masterthought.dtanks.bot.turret;

import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.point;

import net.masterthought.dtanks.moveable;

class Turret{

private Heading heading;
private Arena arena;
private Point position;
private float speed;

 this(Heading heading){
   this.heading = heading;
 }

mixin Moveable; 

}
