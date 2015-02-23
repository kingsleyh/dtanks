module net.masterthought.dtanks.gui.guibot;

import dsfml.graphics;

class GuiBot : Drawable {

Texture botBodyTexture;
Texture turretTexture;
float x;
float y;

this(Texture botBodyTexture, Texture turretTexture, float x, float y){
 this.botBodyTexture = botBodyTexture;
 this.turretTexture = turretTexture;
 this.x = x;
 this.y  =y;
}

  void draw(RenderTarget target, RenderStates states){

  auto botBody = new Sprite(botBodyTexture);
   botBody.position = Vector2f(x,y);

auto turret = new Sprite(turretTexture);
turret.position = Vector2f(x+8,y-8);


   //auto head = new CircleShape(100);
   auto healthBar = new RectangleShape(Vector2f(100,3));
    healthBar.fillColor = Color.Green;
    healthBar.position = Vector2f(x-30,y+45);

   target.draw(botBody);
   target.draw(turret);
   target.draw(healthBar);

   //auto texture = new Texture();
   // if(!texture.loadFromFile("resources/grass.png"))
   //     return;
   //   auto sprite = new Sprite(texture);

  }


}
