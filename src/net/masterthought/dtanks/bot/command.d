module net.masterthought.dtanks.bot.command;

struct Command {

  float speed;
  float heading;
  float radarHeading;
  float turretHeading;
  float firePower = 3;

  public void fire(float power){
     firePower = power;
  }

}
