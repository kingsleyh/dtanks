module net.masterthought.dtanks.properties;

import std.file;
import std.json;
import std.conv;

class Properties{

static Properties props;

int arenaWidth;
int arenaHeight;
int maxTicks;
bool headless;
bool ansi;

this(){
  auto content = to!string(read("properties.json"));
  JSONValue doc = parseJSON(content).object;
  auto arena = doc.object["arena"];
  arenaWidth = to!int(arena["width"].integer);
  arenaHeight = to!int(arena["height"].integer);
  maxTicks = to!int(doc.object["maxTicks"].integer);
  headless = doc.object["headless"].type() == JSON_TYPE.TRUE;
  ansi = doc.object["ansi"].type() == JSON_TYPE.TRUE;
}

  @property public static Properties all(){
     if(Properties.props){
      return Properties.props;
     } else {
      Properties.props = new Properties();
      return Properties.props;
     }
  }


}
