module net.masterthought.dtanks.bot.command;

import net.masterthought.dtanks.heading;

struct Command {

  float speed;
  Heading heading;
  Heading radarHeading;
  Heading turretHeading;
  int firePower = 0;

  public void fire(int power){
     firePower = power;
  }

}
