module net.masterthought.dtanks.bot.sensor;

import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.point;
import dsfml.graphics;

struct Sensor{

  int ticks;
  float health;
  float speed;
  //float gunEnergy;
  Point position;
  Heading heading;
  //Heading radarHeading;
  Heading turretHeading;
  Window guiWindow; 

public bool buttonDown(Keyboard.Key key){
	return Keyboard.isKeyPressed(key);
	 //if(Keyboard.isKeyPressed(Keyboard.Key.Left)){
        //  writeln("you pressed the LEFT key");
        //}
}

}
