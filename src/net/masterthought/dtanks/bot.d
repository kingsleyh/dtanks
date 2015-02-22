//module net.masterthought.dtanks.bot;

//import net.masterthought.dtanks.arena;
////import net.masterthought.dtanks.heading;

//import net.masterthought.dtanks.point;
////import net.masterthought.dtanks.bot.radar;
////import net.masterthought.dtanks.bot.turret;

//class Bot {

//  private Arena arena;
//  private Brain brain;
//  //private Radar radar;
//  //private Turret turret;
//  private int ticks;
//  private int health;
//  //private int firePower;
//  //private int gunEnergy;

//  //private int speed;
//  //private int heading;

//  public String guiWindow;

//  this(Arena arena, string brainKlass){
//     this.arena = arena;
//     this.brain = new brainKlass(this.arena);
//     this.ticks = 0;

//     this.health = 100;
//     //this.speed = 0;
//     //this.fire_power = void;
//     //this.heading  = new Heading();
//     this.position = new Point(0, 0, this.arena);
//     //this.radar = new Radar(this, this.heading.dup);
//     //this.turret = new Turret(this.heading.dup);
//  }

//  public void name(){
//    this.name = "super name"
//  }

//  public void health(int value){
//    this.health = value;
//  }

//  //public void firePower(int value){
//  //  this.firePower =  value;
//  //}

//  //public void adjustFirePower(){
//  //  this.gunEnergy = 100;
//  //  if(this.gunEnergy <= 0){
//  //     this.firePower = 0;
//  //    } else {
//  //      this.gunEnergy -= 1;
//  //    }
//  //    this.gunEnergy += 1;

//  //    if(this.gunEnergy > 100){
//  //      this.gunEnergy = 100
//  //    }
//  //}

//  //public bool firing(){
//  //  return this.firePower && this.firePower > 0;
//  //}

//  public void reduceHealth(int reduceBy){
//    this.health -= reduceBy;
//  }

//  public bool dead(){
//    return this.health <= 0;
//  }

//  public void tick(){
//    this.ticks += 1;
//    //this.tickBrain;
//    //this.adjustFirePower;
//  }

//  public Sensor sensors(){
//    return Sensor(this.ticks,this.health,this.position)
//  }


//}
