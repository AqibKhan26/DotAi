class Dot{
 PVector pos;
 PVector vel;
 PVector acc;
 Brain brain;
 boolean dead=false;
  boolean reachedGoal = false;
 float fitness=0;
 boolean isBest = false;
 Dot(){
   brain=new Brain(1000);
   pos=new PVector(width/2,height-10);
   vel=new PVector(0,0);
   acc=new PVector(0,0);
 }
 
 
//--------------------------------------------------------------------------
  void show(){
    if (isBest) {
      fill(0, 255, 0);
      ellipse(pos.x, pos.y, 8, 8);
    } else {//all other dots are just smaller black dots
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);
    }
  }
//----------------------------------------------------------------------------
  void move(){
    if(brain.direction.length>brain.step){
      acc=brain.direction[brain.step];
      brain.step++;
    }else {//if at the end of the directions array then the dot is dead
      dead = true;
    }
    vel.add(acc);
    vel.limit(5);
    pos.add(vel); 
  }
  
//-----------------------------------------------------------------------------
  void update(){
    if(!dead && !reachedGoal){
      move();
    if (pos.x< 2|| pos.y<2 || pos.x>width-2 || pos.y>height -2) {//if near the edges of the window then kill it 
        dead = true;
      }else if (dist(pos.x, pos.y, goal.x, goal.y)<5) {//if reached goal
        reachedGoal = true;
      }else if (pos.x< 500 && pos.y < 110 && pos.x > 0 && pos.y > 100) {//if hit obstacle
       dead = true;
      }
      //else if (pos.x< 500 && pos.y < 110 && pos.x > 0 && pos.y > 100) {//if hit obstacle
      //dead = true;
      //}
    }
  }
//------------------------------------------------------------------------------------
void calculateFitness(){
   if (reachedGoal) {//if the dot reached the goal then the fitness is based on the amount of steps it took to get there
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
    } else {//if the dot didn't reach the goal then the fitness is based on how close it is to the goal
      float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
}
//-----------------------------------------------------------------------------------
Dot makeOffspring(){
  Dot offs=new Dot();
  offs.brain=brain.clone();
  return offs;
}
//------------------------------------------------------------------------------------------
  
  
}
