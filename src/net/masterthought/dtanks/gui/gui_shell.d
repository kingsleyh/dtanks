module net.masterthought.dtanks.gui.guishell;

import dsfml.graphics;
import std.conv;
import net.masterthought.dtanks.shell;

class GuiShell : Drawable {

Texture shellTexture;
Shell shell;
float x;
float y;


this(Texture shellTexture, Shell shell){
 this.shellTexture = shellTexture;
 this.shell = shell;
 this.x = shell.position.x;
 this.y  = shell.position.y;
}

  void draw(RenderTarget target, RenderStates states){

  auto shellBody = new Sprite(shellTexture);
   shellBody.position = Vector2f(x,y);
   //botBody.origin(Vector2f(18,19));
   shellBody.rotation(this.shell.heading.toDegrees());

   target.draw(shellBody);

  }


}
