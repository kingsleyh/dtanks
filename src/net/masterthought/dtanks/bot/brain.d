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

// is this used? could it be private then used in core_bot to prevent having to pass sensors into sub methods within a users tank brain impl?
  public void setSensors(Sensor sensors){
    this.sensors = sensors;
  }

  public Command tick(Sensor sensors){
     return command;
  }

  public string name(){
    return "no name";
  }

  public string skin(){
    return "blue";
  }



}


