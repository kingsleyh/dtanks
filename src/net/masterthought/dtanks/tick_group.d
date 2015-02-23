module net.masterthought.dtanks.tickgroup;

import std.algorithm;
import std.array;
import std.range;
import net.masterthought.dtanks.corebot;



//you need to implement three methods: empty, popFront, and front. empty returns bool telling if it is empty or not. front returns the current element. popFront advances to the next element
// dont need opApply if using those three;

class TickGroup {

  CoreBot[] list;

  this(){
    list = [];
  }

  public void add(CoreBot[] bots){
    list ~= bots;
  }

  public ulong count(){
    return list.length;
  }

  public void tick(){
    foreach(bot ; list){
      bot.tick();
    }
  }

  public bool empty(){
    return list.empty();
  }

  public void popFront(){
    list.popFront();
  }

  public CoreBot front(){
    return list.front();
  }

//  int opApply(int delegate(ref string) dg){

//int result = 0;

//        for (int i = 0; i < list.length; i++)
//        {
//            result = dg(list[i]);
//            if (result)
//                break;
//        }
//        return result;
//  }

}



