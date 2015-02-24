module net.masterthought.dtanks.bot.command;

import net.masterthought.dtanks.heading;

struct Command {

  float speed;
  Heading heading;
  Heading radarHeading;
  Heading turretHeading;
  float firePower = 3;

  public void fire(float power){
     firePower = power;
  }

}
