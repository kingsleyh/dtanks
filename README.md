# DTanks - Robot Tank Battle Game

Dtanks is a robot tank battle game for D programmers. Players program the brain of a tank and then send their tank+brain into battle with other tanks. 

## Background

As part of my exploration and learning of the D programming language I wanted to make something that would be fun and also help me to learn D. This is the result of that endeavour.

## Rules

The rules are simple. The last tank still alive is the winner. If there are multiple tanks still alive by the end of the game then the one with the highest amount of life left is the winner.

The gameplay is very straight forward. Each tank has a **base**, **turret** and **radar**, each of which rotate independently. The base moves the tank, the turret has a gun mounted on it which can fire at other tanks. The radar detects other tanks in its field of vision.

## Example Battle

This is a short clip of what a battle looks like:

<iframe width="420" height="315" src="https://www.youtube.com/embed/t-Z-FJ-MoMo" frameborder="0" allowfullscreen></iframe>

## Getting Started

See the getting started guide.

## Influences

Dtanks is based on the ruby project [RTanque](https://github.com/awilliams/RTanque) and inspired by many other versions in different languages. The main source being the original Java project [Robocode](http://robocode.sourceforge.net/)

Most of the credit of this project must be given to [Adam Williams](https://github.com/awilliams) who wrote the RTanque project that most of this code is based on. Adam also credits several other projects which helped him to end up with what he created and so I shall also list these as inspirational in the development of DTanks:

* [RobotWar](http://corewar.co.uk/robotwar/) - Perhaps the canonical version. Created in 1970's and set in the distant 2002. Apple II
* [Robocode](http://robocode.sourceforge.net/) - Java game, originally from IBM. Tank & explosion images taken from here.
* [RRobots](http://rrobots.rubyforge.org/) - Ruby port of Robocode. 2005
* [RRobots fork](https://github.com/ralreegorganon/rrobots)
* [FightCode](http://fightcodegame.com/) - Online javascript tank game
* [Scalatron](http://scalatron.github.com/) - Scala bot game
* [Many more...](https://www.google.com/?q=robocode%20clone)
 
## Requirements

The [DSFML](https://github.com/Jebbs/DSFML) library is used to render the game in 2D. There are pre-built libraries included for OSX, Linux and Windows.

## Quick Start

clone the dtanks repository from github:

    git clone https://github.com/masterthought/dtanks.git
    cd dtanks
  
Set up your DSFML dependency in the dub.json. Edit dub.json and point it to the correct DSFML library for your platform e.g:

    "lflags" : ["-L/Users/kings/projects/dtanks/DSFM/OSX/lib"],

To start the game run:

    dub
  
When the game starts initially there will be 2 tanks. StaticBot and Keyboard - these are starter tanks to help you get started. You will find them in the following directory:

    dtanks/src/mytanks
    
There are also some sample tanks in the directory:

    dtanks/samples

The StaticBot tank doesn't do anything - it just sits there. The Keyboard tank can be controlled with the keyboard and can do various things:

Any tanks you put in dtanks/src/mytanks will be included in the game.

#### Keyboard Tank Controls

| Key           | Action        |
| ------------- | ------------- |
| A  | Rotate tank body left  |
| D  | Rotate tank body right  |
| W  | Move tank body forward  |
| S  | Move tank body backwards  |
|   |   |
| Arrow Left  | Rotate tank turret left  |
| Arrow Right  | Rotate tank turret right  |
| Arrow Up  | Fire max power shot  |
| Arrow Down  | Fire min power shot  |
|||
|R| Rotate tank radar left|
|T| Rotate tank radar right|
|C| Randomly change tank colour|

## DTanks Documentation

coming soon

## DTanks API

The tank api consists of reading input from Brain#sensors and giving output to Brain#command

#### Brain Sensors

    module net.masterthought.dtanks.samples.staticbot;

    import net.masterthought.dtanks.brainhelper;
    import net.masterthought.dtanks.bot.brain;
    import net.masterthought.dtanks.arena;
    import net.masterthought.dtanks.bot.sensor;
    import net.masterthought.dtanks.bot.command;
    import net.masterthought.dtanks.heading;
    import net.masterthought.dtanks.skincolor;
    import dsfml.graphics;

    import std.random;
    import std.stdio;
    import std.range;

    class StaticBot : Brain {

       static this(){
         Brain.add(new StaticBot());
       }

       override public Command tick(Sensor sensors){
         sensors.ticks; // int
         sensors.health; // float
         sensors.speed; // float
         sensors.position; // Point
         sensors.heading; // Heading
         sensors.radarHeading; // Heading
         sensors.turretHeading; // Heading
         sensors.radar; // Radar
         sensors.arena; // Arena
         return command;
       }

      override public string name(){
       return "static_tank";
      }

      override public SkinColor skin(){
       return SkinColor.green;
      }

   }

From the Radar you get reflections. A reflection contains details about an enemy tank that the radar has picked up. The Radar returns a list of reflections which have the following properties:

     sensors.radar.getReflections // Reflection[] 
     
     foreach(reflection ; sensors.radar.getReflections){
       reflection.heading // Heading (heading to the other bot)
       reflection.distance // float (distance to the other bot)
       reflection.name // string (name of the other bot)
     }

#### Brain Commands

    override public Command tick(Sensor sensors){
         command.speed = 2; // double (sets bot speed)
         command.heading = Heading.NORTH // Heading (sets the bot heading)
         command.radarHeading = currentRadarHeadingPlusDegrees(3); // Heading (sets radar heading)
         command.turretHeading = currentTurretHeadingPlusDegrees(3); // Heading (sets turret heading)
         command.firPower = 1; // int (sets firePower) 0 is not firing
         return command;
       }

#### Heading

The heading class deals with calculating the heading as well as other information. Most of the time you will need to get the .radians from the heading which you can perform math calculations on and create a new heading.