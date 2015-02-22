
import std.stdio;

class Vehicles{

  string color;
  string name;

  this(string name){
    this.color = "red";
     this.name = name;
  }

  public void setColor(string color){
    this.color = color;
  }

  public string getColor(){
    return this.color;
  }

}

class Car : Vehicles {

this(string name){
  super(name);
}

public override string getColor(){
  return "green";
}

}


void main(){

//Vehicles v = new Vehicles();
//writeln(v.getColor());

Car c = new Car("woop");
writeln(c.getColor());

}
