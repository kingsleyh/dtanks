import std.stdio;
import std.algorithm;
import std.array;
import std.random;
import std.conv;

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


void main(){

  writeln(uniform(0.0,100.0));

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
