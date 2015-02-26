module net.masterthought.dtanks.gui.healthcolorcalculator;

import std.array;
import std.algorithm;

class HealthColorCalculator {

  enum FULL_HEALTH_COLOR = [74,190,74];
  enum MEDIUM_HEALTH_COLOR = [255,190,0];
  enum LOW_HEALTH_COLOR = [220,0,0];

  int health;

  this(int health){
    this.health = health;
  }

  public double[] colorAsRgb(){
    if(this.health > 60){
       return FULL_HEALTH_COLOR;
    } else if(this.health < 60 && this.health > 30)
      return MEDIUM_HEALTH_COLOR;
    else {
      return LOW_HEALTH_COLOR;
    }
  }

}
