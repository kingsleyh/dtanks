module net.masterthought.dtanks.gui.guibot;

import dsfml.graphics;
import std.conv;
import std.algorithm;
import std.array;
import net.masterthought.dtanks.corebot;
import net.masterthought.dtanks.gui.healthcolorcalculator;
import net.masterthought.dtanks.heading;
import net.masterthought.dtanks.gui.skins;

class GuiBot : Drawable {

Texture botBodyTexture;
Texture turretTexture;
Texture radarTexture;
BotSkin[string] skin;
Font font;
CoreBot bot;
float x;
float y;
string name;
CoreBot[] allBots;

this(BotSkin[string] skin,Font font, CoreBot bot, CoreBot[] allBots){
 this.skin = skin;
 this.botBodyTexture = skin[bot.getSkin()].tankBody;
 this.turretTexture = skin[bot.getSkin()].tankTurret;
 this.radarTexture = skin[bot.getSkin()].tankRadar;
 this.font = font;
 this.bot = bot;
 this.x = bot.position.x;
 this.y  = bot.position.y;
 this.name = bot.getName();
 this.allBots = allBots;
}

  void draw(RenderTarget target, RenderStates states){

  auto botBody = new Sprite(botBodyTexture);
   botBody.position = Vector2f(x,y);
   botBody.origin(Vector2f(18,19));
   botBody.rotation(this.bot.heading.toDegrees());


auto turret = new Sprite(turretTexture);
turret.position = Vector2f(x,y);
turret.origin(Vector2f(10,27));
turret.rotation(this.bot.turret.heading.toDegrees());

auto radar = new Sprite(radarTexture);
radar.position = Vector2f(x,y);
radar.origin(Vector2f(11,8));
radar.rotation(this.bot.radar.heading.toDegrees());

   auto healthBar = new RectangleShape(Vector2f(bot.health,3));
   double[] color = new HealthColorCalculator(bot.health).colorAsRgb();
   healthBar.fillColor = Color(to!ubyte(color[0]),to!ubyte(color[1]),to!ubyte(color[2]));
   healthBar.position = Vector2f(x-50,y+35);


    auto botName = new Text("" ~ to!dstring(name), font, 12);
    botName.position = Vector2f(x-50,y+45);

    // DEBUG
    auto posX = new Text("X: " ~ to!dstring(x),font,12);
    posX.position = Vector2f(x-50,y+60);

    auto posY = new Text("Y: " ~ to!dstring(y),font,12);
    posY.position = Vector2f(x-50,y+73);

     auto dHeading = new Text("H: " ~ to!dstring(bot.heading.toDegrees()),font,12);
    dHeading.position = Vector2f(x-50,y+86);

    auto tHeading = new Text("T: " ~ to!dstring(bot.turret.heading.toDegrees()),font,12);
    tHeading.position = Vector2f(x-50,y+99);

    auto fpower = new Text("F: " ~ to!dstring(bot.firePower),font,12);
    fpower.position = Vector2f(x-50,y+112);

    auto life = new Text("L: " ~ to!dstring(bot.health),font,12);
    life.position = Vector2f(x-50,y+124);

auto dRadar = new Text("R: " ~ to!dstring(bot.radar.heading.toDegrees()),font,12);
    dRadar.position = Vector2f(x-50,y+136);

  if(name == "SuperBot"){

    // get other bots
    CoreBot[] otherBots = allBots.filter!(b => b != bot).array;

    // draw distance lines
    foreach(tb ; otherBots){
       auto line = new VertexArray(PrimitiveType.Lines, 2);
       line.append(Vertex(Vector2f(bot.position.x,bot.position.y), Color(224,224,224)));
       line.append(Vertex(Vector2f(tb.position.x,tb.position.y), Color.Blue));

      auto botDistance = bot.position.pointDistance(bot.position,tb.position);
      float midX = (bot.position.x + tb.position.x) / 2;
      float midY = (bot.position.y + tb.position.y) / 2;

      auto dist = new Text(to!dstring(botDistance),font,9);
      dist.position = Vector2f(midX,midY);
       target.draw(dist);
       target.draw(line);

       //draw radar scope
   //  float search = Heading.deltaBetweenPoints(bot.position, bot.heading.radians, tb.position);
   //auto r = new Text("R: " ~ to!dstring(search),font,12);
   // r.position = Vector2f(x-50,y+136);
   //target.draw(r);

    }



  }

   target.draw(botName);
   target.draw(botBody);
   target.draw(turret);
   target.draw(radar);
   target.draw(healthBar);

   target.draw(posX);
   target.draw(posY);
   target.draw(dHeading);
   target.draw(tHeading);
   target.draw(fpower);
   target.draw(life);
    target.draw(dRadar);

  }




}
