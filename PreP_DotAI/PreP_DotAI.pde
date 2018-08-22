Population test;
PVector goal  = new PVector(400, 10);


void setup(){
  size(800,600);
  frameRate(1000);
  test= new Population(1000);
  
}

void draw(){
 background(255); 
 fill(255, 0, 0);
 ellipse(goal.x, goal.y, 10, 10);
fill(0,255, 0);
 rect(0,100,500,10);
 //fill(0,255, 0);
  //rect(200,400,500,10);
  if(test.allDotsDead()){
    test.calculateFitness();
    test.naturalSelection();
    test.mutateOffspring();
  }else{
  test.show();
  test.update();
  }
  
}
