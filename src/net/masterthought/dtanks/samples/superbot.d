module net.masterthought.dtanks.samples.superbot;

import net.masterthought.dtanks.bot.brain;
import net.masterthought.dtanks.arena;
import net.masterthought.dtanks.bot.sensor;
import net.masterthought.dtanks.bot.command;
import net.masterthought.dtanks.heading;
import dsfml.graphics;

import std.random;
import std.stdio;

class SuperBot : Brain {

   this(Arena arena){
    super(arena);
   }

  override public Command tick(Sensor sensors){
    //command.speed = 3;
    //command.heading = new Heading(Heading.NE);
    //command.turretHeading = new Heading(Heading.N);
    
    writeln(sensors);

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
     command.speed = 2;
    } else if(sensors.buttonDown(Keyboard.Key.S)){
      command.speed = -2;
    } else {
      command.speed = 0;
    }

    // if sensors.button_down?(Gosu::KbLeft)
    //  command.turret_heading = sensors.turret_heading - (RTanque::Heading::ONE_DEGREE * 10)
    //elsif sensors.button_down?(Gosu::KbRight)
    //  command.turret_heading = sensors.turret_heading + (RTanque::Heading::ONE_DEGREE * 10)
    //end

    //if sensors.button_down?('a')
    //  command.heading = sensors.heading - (RTanque::Heading::ONE_DEGREE * 10)
    //elsif sensors.button_down?('d')
    //  command.heading = sensors.heading + (RTanque::Heading::ONE_DEGREE * 10)
    //end

    //if sensors.button_down?('w')
    //  command.speed = 10
    //elsif sensors.button_down?('s')
    //  command.speed = -10
    //else
    //  command.speed = 0
    //end

    //if sensors.button_down?(Gosu::KbUp)
    //  command.fire_power = 5
    //elsif sensors.button_down?(Gosu::KbDown)
    //  command.fire_power = 1
    //end

    return command;
  }

  override public dstring name(){
    return "SuperBot";
  }

}
