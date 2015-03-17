module net.masterthought.dtanks.samples.keyboardbot;

import net.masterthought.dtanks.brainhelper;
import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import dsfml.graphics;

import std.random;
import std.stdio;

class KeyboardBot : Brain {

   static this(){
     Brain.add(new KeyboardBot());
   }

 override public Command tick(Sensor sensors){
    if(sensors.buttonDown(Keyboard.Key.Left)){
     command.turretHeading = new Heading(sensors.turretHeading.radians - Heading.ONE_DEGREE * 3);
    } else if(sensors.buttonDown(Keyboard.Key.Right)){
      command.turretHeading = new Heading(sensors.turretHeading.radians + Heading.ONE_DEGREE * 3);
    }

 if(sensors.buttonDown(Keyboard.Key.A)){
     command.heading = new Heading(sensors.heading.radians - Heading.ONE_DEGREE * 3);
    } else if(sensors.buttonDown(Keyboard.Key.D)){
      command.heading = new Heading(sensors.heading.radians + Heading.ONE_DEGREE * 3);
    }

     if(sensors.buttonDown(Keyboard.Key.W)){
     command.speed = 20;
    } else if(sensors.buttonDown(Keyboard.Key.S)){
      command.speed = -2;
    } else {
      command.speed = 0;
    }

    if(sensors.buttonDown(Keyboard.Key.Up)){
     command.firePower = 5;
    } else if(sensors.buttonDown(Keyboard.Key.Down)){
      command.firePower = 1;
    } else {
      command.firePower = 0;
    }

   if(sensors.buttonDown(Keyboard.Key.R)){
     command.radarHeading = new Heading(sensors.radar.heading.radians - Heading.ONE_DEGREE * 3);
    } else if(sensors.buttonDown(Keyboard.Key.T)){
      command.radarHeading = new Heading(sensors.radar.heading.radians + Heading.ONE_DEGREE * 3);
    }

    return command;
  }

  override public string name(){
    return "Keyboard";
  }

  override public string skin(){
    return "green";
  }

}
