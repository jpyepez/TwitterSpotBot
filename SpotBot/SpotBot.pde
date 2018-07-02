import java.util.*;
import com.hamoid.*;

SpotSysGaussian spotSystem;

void setup(){
  size(1080, 1080);
  background(255);

  resetSketch();
  saveAndExit();
}

void draw(){
  // no draw loop
}

////////////
// Functions
void resetSketch() {
  background(255);

  int systemType = (int) random(0, 2);
  createSystem(systemType);
}

void saveAndExit(){
  save("output.png");
  exit();
}

void createSystem(int type) {
  switch(type) {
  case 0:	
    createGaussianSystem();
    break;
  case 1:	
    createGaussianSystemRndRadius();
    break;
  default:
    break;
  }
}

void createGaussianSystem() {
  float stdDev = random(150, 250);
  int numSides = int(random(2, 7));
  float radius = random(15, 40);
  spotSystem = new SpotSysGaussian(stdDev);
  spotSystem.addMany((int)random(150, 400),
                     numSides,
                     radius/constrain(0.25*numSides, 1, 10));
}

void createGaussianSystemRndRadius() {
  float stdDev = random(150, 250);
  int numSides = int(random(2, 7));
  spotSystem = new SpotSysGaussian(stdDev);
  spotSystem.addManyRndRadius((int)random(150, 400),
                     numSides,
                     15, 40);
}

////////////
// Callbacks
void mouseReleased() {
  resetSketch();
}
