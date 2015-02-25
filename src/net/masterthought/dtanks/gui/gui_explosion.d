module net.masterthought.dtanks.gui.guiexplosion;

import dsfml.graphics;
import std.conv;
import std.array;
import net.masterthought.dtanks.explosion;

class GuiExplosion : Drawable {

Texture[] explosionTextures;
Explosion explosion;
float x;
float y;


this(Texture[] explosionTextures, Explosion explosion){
 this.explosionTextures = explosionTextures;
 this.explosion = explosion;
 this.x = explosion.position.x;
 this.y  = explosion.position.y;
}

void draw(RenderTarget target, RenderStates states){

 
  foreach(texture ; explosionTextures){
  	auto exploder = new Sprite(texture);
    exploder.position = Vector2f(x,y);
    target.draw(exploder);
    explosionTextures.popFront();
  }

}

}