module net.masterthought.dtanks.bot.sensor;

import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.point;
import net.masterthought.dtanks.bot.radar;
import net.masterthought.dtanks.arena;
import dsfml.graphics;

struct Sensor{

  int ticks;
  float health;
  float speed;
  int gunEnergy;
  Point position;
  Heading heading;
  Radar radar;
  Heading radarHeading;
  Heading turretHeading;
  Window guiWindow;
  Arena arena;

public bool buttonDown(Keyboard.Key key){
	return Keyboard.isKeyPressed(key);
}

}
