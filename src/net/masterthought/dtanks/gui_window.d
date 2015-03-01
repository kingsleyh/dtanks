module net.masterthought.dtanks.guiwindow;

import dsfml.graphics;
import std.datetime;
import std.algorithm;
import std.stdio;
import std.conv;
import std.array;
import std.range;
import net.masterthought.dtanks.gui.guibot;
import net.masterthought.dtanks.gui.guishell;
import net.masterthought.dtanks.gui.guiexplosion;
import net.masterthought.dtanks.match;
import net.masterthought.dtanks.gui.skins;


class GuiWindow{

private Match match;
private BotSkin[string] skins;


this(Match match){
  this.match = match;
}

 public void execute(){

ContextSettings settings;
settings.antialiasingLevel = 8;

 auto window = new RenderWindow(VideoMode(match.arena.width,match.arena.height),"DTanks", Window.Style.DefaultStyle, settings);
  window.setFramerateLimit(60);

string[] availableSkins = ["black","blue","green","orange","pink","purple","purple2","red","white","yellow"];

foreach(s; availableSkins){

  auto botBodyTexture = new Texture();
    if(!botBodyTexture.loadFromFile("resources/skins/" ~ s ~ "/body.png"))
        return;

auto turretTexture = new Texture();
    if(!turretTexture.loadFromFile("resources/skins/" ~ s ~ "/turret.png"))
        return;

      auto radarTexture = new Texture();
    if(!radarTexture.loadFromFile("resources/skins/" ~ s ~ "/radar.png"))
        return;
 skins[s] = BotSkin(botBodyTexture, turretTexture, radarTexture);

}


      auto shellTexture = new Texture();
    if(!shellTexture.loadFromFile("resources/bullet.png"))
        return;

       auto font = new Font();
    if(!font.loadFromFile("resources/arial.ttf"))
        return;

auto texture = new Texture();
    if(!texture.loadFromFile("resources/grass.png"))
        return;
      auto sprite = new Sprite(texture);


  //Texture[] explosionTextures = [];
  //foreach(n ; iota(1,71)){
  //  auto t = new Texture();
  //  if(!t.loadFromFile("resources/explosions/explosion2-" ~ to!string(n) ~ ".png"))
  //      return;
  //   explosionTextures ~= t;
  //}

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

        if(this.match.finished()){
          //window.close();
        }

      this.match.incrementTicks();

        window.clear();

window.draw(sprite);


 foreach(bot ; this.match.bots){
       bot.setGuiWindow(window);
       window.draw(new GuiBot(skins,font,bot,this.match.bots));
   }




   //remove dead shells
   this.match.shells = this.match.shells.filter!(n => !n.isDead()).array;

   foreach(shell ; this.match.shells){
        window.draw(new GuiShell(shellTexture,shell));
   }

//foreach(explosion ; this.match.explosions){
// foreach(exTexture ; explosionTextures){
//    auto exploder = new Sprite(exTexture);
//    //Point point = Point.rand(this.match.arena);
//    exploder.position = Vector2f(explosion.position.x,explosion.position.y);
//    window.draw(exploder);
//    explosionTextures.popFront();
//  }
//}
    //foreach(explosion ; this.match.explosions){

      //window.draw(new GuiExplosion(explosionTextures, new Explosion(Point.rand(this.match.arena))));
    //}

     //remove dead bots
   this.match.bots= this.match.bots.filter!(n => !n.isDead()).array;

     auto tickMonitor = new Text("Ticks: " ~ to!dstring(this.match.ticks), font, 12);
     tickMonitor.position = Vector2f(10,this.match.arena.height - 30);
     tickMonitor.setColor(Color.Yellow);
     window.draw(tickMonitor);

        window.display();
    }


 }

}
