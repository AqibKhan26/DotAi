class Brain{
 PVector[] direction;
int step=0;

Brain(int size){
  direction=new PVector[size];
  randomize();
}

void randomize(){
  for(int i=0;i<direction.length;i++){
    float randomAngle=random(2*PI);
    direction[i]=PVector.fromAngle(randomAngle);
  }
}
//-----------------------------------------------------------
Brain clone() {
    Brain clone = new Brain(direction.length);
    for (int i = 0; i < direction.length; i++) {
      clone.direction[i] = direction[i].copy();
    }

    return clone;
  }
//-----------------------------------------------------------------
void mutate() {
    float mutationRate = 0.01;//chance that any vector in directions gets changed
    for (int i =0; i< direction.length; i++) {
      float rand = random(1);
      if (rand < mutationRate) {
        //set this direction as a random direction 
        float randomAngle = random(2*PI);
        direction[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
  
  
  
}
