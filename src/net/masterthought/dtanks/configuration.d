module net.masterthought.dtanks.configuration;

import std.range;
import std.array;
import std.math;

struct Configuration{

  enum ONE_DEGREE = (PI / 180.0);

  struct bot{
   int radius = 19;
   int healthReductionOnException = 2;
   int[] health = iota(0,101).array;
   double[] speed = iota(-3.0,4.0).array;
   double speedStep = 0.05;
   float turnStep = ONE_DEGREE *  1.5;
   int[] firePower = iota(1,6).array;
   int gunEnergyMax = 10;
   int gunEnergyFactor = 10;
  }

  struct turret {
    int length = 28;
    float turnStep = ONE_DEGREE * 2.0;
  }

  struct radar{
    float turnStep = 0.05;
  }

  struct shell{
    float speedFactor = 4.5;
    float ratio = 1.5;
  }

  struct explosion {
    int lifeSpan = 70 * 1;
  }



}
