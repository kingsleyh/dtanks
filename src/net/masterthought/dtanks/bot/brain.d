module net.masterthought.dtanks.bot.brain;

import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.bot.radar;
import net.masterthought.dtanks.runner;

class Brain {

  public Sensor sensors;
  public Command command;

this(){

}

static add(Brain brain){
  Runner.addBrain(brain);
}

  public void setSensors(Sensor sensors){
    this.sensors = sensors;
  }

  public Command tick(Sensor sensors){
      this.sensors = sensors;
     return command;
  }

  public string name(){
    return "no name";
  }

  public string skin(){
    return "blue";
  }



}


