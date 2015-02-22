module net.masterthought.dtanks.gui.guibot;

import dsfml.graphics;

class GuiBot : Drawable {

Texture botBodyTexture;
Texture turretTexture;
int x;
int y;

this(Texture botBodyTexture, Texture turretTexture, int x, int y){
 this.botBodyTexture = botBodyTexture;
 this.turretTexture = turretTexture;
 this.x = x;
 this.y  =y;
}

  void draw(RenderTarget target, RenderStates states){

  auto botBody = new Sprite(botBodyTexture);
   botBody.position = Vector2f(x,y);

auto turret = new Sprite(turretTexture);
turret.position = Vector2f(y+8,x-8);

   target.draw(botBody);
   target.draw(turret);

   //auto texture = new Texture();
   // if(!texture.loadFromFile("resources/grass.png"))
   //     return;
   //   auto sprite = new Sprite(texture);

  }


}
