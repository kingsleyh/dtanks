import std.stdio;
import std.algorithm;


class Foo {

  string[] list;

  this(){
    list = [];
  }

  public void add(string item){
    list ~= item;
  }


  int opApply(int delegate(ref string) dg){

int result = 0;

        for (int i = 0; i < list.length; i++)
        {
            result = dg(list[i]);
            if (result)
                break;
        }
        return result;
  }

}


void main(){

  writeln("hello");
  Foo foo = new Foo();
  foo.add("apple");
  foo.add("cars");


  foreach(n ; foo){
    writeln(n);
  }


}
