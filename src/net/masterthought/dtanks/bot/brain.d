module net.masterthought.dtanks.bot.brain;

import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.bot.radar;

class Brain {

  public Sensor sensors;
  public Command command;
  private Arena arena;

  this(Arena arena){
    this.arena = arena;
  }

  public void setSensors(Sensor sensors){
    this.sensors = sensors;
  }

  //public void setCommand(Command command){
  //  this.command = command;
  //}

  //public void tick(Sensors[] sensors){
  //  this.sensors = sensors;
  //  new Command(t)
  //}

  public Command tick(Sensor sensors){
     return command;
  }

  public string name(){
    return "no name";
  }

}


