module net.masterthought.dtanks.match;

class Match{

 private Arena arena;
 private int maxTicks;
 private bool teams;
 private int ticks;
 private bool stopped;
 //private TickGroup bots;

 this(Arena arena){
    this.arena = arena;
    this.ticks = 0;
    this.stopped = false;
 }

 public void teams(bool value){
    this.teams = value;
 }

 public bool maxTicksReached(){
  return this.maxTicks && this.ticks >= this.maxTicks;
 }

 public bool finished(){
  return this.stopped || this.maxTicksReached || this.bots.count <= 1 ||
  (this.teams && this.bots.map(n => n.name).array.sort.uniq.array.size ==1);
 }

 public void addBots(Bots... bots){
    this.bots.add(bots);
 }

 public void start(){
   while(!this.finished){
    self.tick;
   }
 }

 public void stop(){
  this.stopped = true;
 }

 public void ticks(){
  this.ticks += 1;
 }

}
