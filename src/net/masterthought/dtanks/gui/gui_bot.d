module net.masterthought.dtanks.gui.guibot;

import dsfml.graphics;
import std.conv;
import net.masterthought.dtanks.corebot;

class GuiBot : Drawable {

Texture botBodyTexture;
Texture turretTexture;
Font font;
CoreBot bot;
float x;
float y;
dstring name;

this(Texture botBodyTexture, Texture turretTexture, Font font, CoreBot bot){
 this.botBodyTexture = botBodyTexture;
 this.turretTexture = turretTexture;
 this.font = font;
 this.bot = bot;
 this.x = bot.position.x;
 this.y  = bot.position.y;
 this.name = bot.getName();
}

  void draw(RenderTarget target, RenderStates states){

  auto botBody = new Sprite(botBodyTexture);
   botBody.position = Vector2f(x,y);
   botBody.origin(Vector2f(18,19));
   botBody.rotation(this.bot.heading.toDegrees());

auto turret = new Sprite(turretTexture);
turret.position = Vector2f(x,y);
turret.origin(Vector2f(10,27));
turret.rotation(this.bot.turret.getHeading().toDegrees());

   auto healthBar = new RectangleShape(Vector2f(100,3));
    healthBar.fillColor = Color.Green;
    healthBar.position = Vector2f(x-50,y+35);


    auto botName = new Text(name, font, 12);
    botName.position = Vector2f(x-50,y+45);
    //text.rotation(10);

   target.draw(botName);
   target.draw(botBody);
   target.draw(turret);
   target.draw(healthBar);


   //auto texture = new Texture();
   // if(!texture.loadFromFile("resources/grass.png"))
   //     return;
   //   auto sprite = new Sprite(texture);

  }


}
