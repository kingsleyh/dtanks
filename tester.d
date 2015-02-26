import std.stdio;
import std.algorithm;
import std.array;
import std.random;
import std.conv;
import std.math;
import std.range;
import std.traits;

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

  //string[] list = ["1","2","3","4"];

  //writeln("before: ",list);

  // list = list.filter!(n => n == "1").array;

  //writeln("after: ", list);


 //enum a = [74,190,74].map!(v => v/255.0).array;

  //float oneDegree = (PI / 180.0);
 //string[] vision =  iota(-(oneDegree * 10.0),(oneDegree * 10.0),0.000001).map(i => to!string(i)).array;

  //writeln(vision);

//  float oneDegree = (PI / 180.0);
//float first = -(oneDegree * 10.0);
//float second = (oneDegree * 10.0);
//float step = 0.000001;
//float[] r = iota(first,second,step).array;



double oneDegree = (PI / 180.0);
double first = -(oneDegree * 10.0);
double second = (oneDegree * 10.0);
double step = 0.000001;
double[] r = iota(first,second,step).array;

writeln(r);

double[] hardCoded = [ 0.174521, 0.174522, 0.174523, 0.174524, 0.174525, 0.174526, 0.174527, 0.174528, 0.174529, 0.17453, 0.174531, 0.174532];

double item = 0.174531;
writeln(r.canFind(item));  // false - I expect true!!!!

writeln(hardCoded.canFind(item)); // true - as I expect







//writeln(r);

//float item = 0.174531;
////writeln(r.canFind(item));
//writeln(canFind!(n => n == item)(r));

//string v1 = to!string(r[$-1]);
//string v2 = to!string(0.174532);

//writeln(v1, " : ", v2);

//writeln(to!string(r[$-1]) == to!string(0.174532));

//double n = 0.174531;

//writeln(to!float(n) == to!float(0.174531));

//foreach(i ; r){
//  if(to!float(i) == to!float(n)){
//    writeln("YES");
//  }
//}

//foreach(n ; r){
//  writeln(ReturnType!n x);
//}

//int[] r = [1,2,3];

//writeln(r);

//double n = 0.174531;
//auto res = canFind(r,n);
//writeln(res);

//writeln(r.canFind(0.174531));

  //writeln(iota(-0.17,0.17,0.01));

//writeln(a);

//writeln(to!ubyte(74));

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
