module net.masterthought.dtanks.gui.guibot;

import dsfml.graphics;
import std.conv;

class GuiBot : Drawable {

Texture botBodyTexture;
Texture turretTexture;
Font font;
float x;
float y;
dstring name;

this(Texture botBodyTexture, Texture turretTexture, Font font, float x, float y,dstring name){
 this.botBodyTexture = botBodyTexture;
 this.turretTexture = turretTexture;
 this.font = font;
 this.x = x;
 this.y  =y;
 this.name = name;
}

  void draw(RenderTarget target, RenderStates states){

  auto botBody = new Sprite(botBodyTexture);
   botBody.position = Vector2f(x,y);

auto turret = new Sprite(turretTexture);
turret.position = Vector2f(x+8,y-8);


   auto healthBar = new RectangleShape(Vector2f(100,3));
    healthBar.fillColor = Color.Green;
    healthBar.position = Vector2f(x-30,y+45);


    auto botName = new Text(name, font, 12);
    botName.position = Vector2f(x-30,y+55);
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
