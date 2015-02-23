module net.masterthought.dtanks.guiwindow;

import dsfml.graphics;
import std.datetime;
import std.stdio;
import net.masterthought.dtanks.gui.guibot;
import net.masterthought.dtanks.match;

class GuiWindow{

private Match match;
private GuiBot[] guiBots;

this(Match match){
  this.match = match;
}

 public void execute(){

 auto window = new RenderWindow(VideoMode(800,600),"Hello DSFML!");

    //auto font = new Font();
    //if(!font.loadFromFile("resources/arial.ttf"))
    //    return;
    //auto text = new Text("Hello DSFML", font, 50);
    //text.position = Vector2f(52,51);
    //text.rotation(10);

auto botBodyTexture = new Texture();
    if(!botBodyTexture.loadFromFile("resources/body.png"))
        return;

auto turretTexture = new Texture();
    if(!turretTexture.loadFromFile("resources/turret.png"))
        return;

   foreach(bot ; this.match.bots){
       guiBots ~= new GuiBot(botBodyTexture,turretTexture,bot.position.x,bot.position.y);
   }

    //GuiBot bot = new GuiBot(botBodyTexture,turretTexture,100,100);

     //GuiBot bot2 = new GuiBot(botBodyTexture,turretTexture,50,50);

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

foreach(bot ; guiBots){
 window.draw(bot);
}
 //window.draw(bot2);

 //writeln(std.datetime.Clock.currTime());

        //window.draw(head);
        //window.draw(leftEye);
        //window.draw(rightEye);
        //window.draw(smile);
        //window.draw(smileCover);

        window.display();
    }


 }

}
