module net.masterthought.dtanks.guiwindow;

import dsfml.graphics;
import std.datetime;
import std.stdio;
import net.masterthought.dtanks.gui.guibot;
import net.masterthought.dtanks.match;

class GuiWindow{

private Match match;


this(Match match){
  this.match = match;
}

 public void execute(){

 auto window = new RenderWindow(VideoMode(match.arena.width,match.arena.height),"Hello DSFML!");
  //window.setFramerateLimit(60);

auto botBodyTexture = new Texture();
    if(!botBodyTexture.loadFromFile("resources/body.png"))
        return;

auto turretTexture = new Texture();
    if(!turretTexture.loadFromFile("resources/turret.png"))
        return;

       auto font = new Font();
    if(!font.loadFromFile("resources/arial.ttf"))
        return;

auto texture = new Texture();
    if(!texture.loadFromFile("resources/grass.png"))
        return;
      auto sprite = new Sprite(texture);

 while (window.isOpen())
    {
        Event event;

        while(window.pollEvent(event))
        {
            if(event.type == event.EventType.Closed)
            {
                window.close();
            }
        }

        //if(Keyboard.isKeyPressed(Keyboard.Key.Left)){
        //  writeln("you pressed the LEFT key");
        //}

        //  if(Keyboard.isKeyPressed(Keyboard.Key.Right)){
        //  writeln("you pressed the RIGHT key");
        //}

      this.match.incrementTicks();

        window.clear();

window.draw(sprite);


 foreach(bot ; this.match.bots){
       bot.setGuiWindow(window);
       window.draw(new GuiBot(botBodyTexture,turretTexture,font,bot));
   }

        window.display();
    }


 }

}
