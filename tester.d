import std.stdio;
import std.algorithm;
import std.array;
import std.random;
import std.conv;
import std.math;
import std.range;

class Foo {

  string[] list;

  this(){
    list = [];
  }

  public void add(string item){
    list ~= item;
  }

 public void popFront(){
  list.popFront();
 }

 public bool empty(){
  return list.empty();
 }

 public string front(){
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

class Woo{

  //static const string NAME = "apples";

enum FULL_ANGLE = PI * 2.0;
enum HALF_ANGLE = PI;
enum EIGHTH_ANGLE = PI / 4.0;
enum ONE_DEGREE = FULL_ANGLE / 360.0;
enum FULL_RANGE =  iota(0,FULL_ANGLE);

enum NORTH = 0.0;
alias NORTH N;

}

void main(){

  string[] list = ["1","2","3","4"];

  writeln("before: ",list);
  
   list = list.filter!(n => n == "1").array;

  writeln("after: ", list);

//writeln(uniform(0.0,0.9) * Woo.FULL_ANGLE);

  //writeln(uniform(0.0,100.0));

//string a = "hello";
//dstring b = to!dstring(a);

//writeln(b);

 //string[] list = ["a","b"];

 //list ~= ["c","d"];

 //writeln(list);

  //writeln("hello");
  //Foo foo = new Foo();
  //foo.add("apple");
  //foo.add("cars");


  ////foreach(n ; foo){
  ////  writeln(n);
  ////}

  //writeln(foo.map!(n => "an " ~ n).array);


}
