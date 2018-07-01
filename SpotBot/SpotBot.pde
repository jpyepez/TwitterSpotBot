import java.util.*;
import com.hamoid.*;

SpotSysGaussian spotSystem;

void setup(){
  size(1080, 1080);
  background(255);

  resetSketch();
  save("output.png");
  exit();
}

void draw(){
  // no draw loop
}

void mouseReleased() {
  resetSketch();
}

void resetSketch() {
  float stdDev = random(150, 250);
  int numSides = int(random(2, 7));
  float radius = random(20, 50);
  spotSystem = new SpotSysGaussian(stdDev, numSides, radius);

  background(255);
  addSpots((int)random(150, 250));
}

void addSpots(int times) {
  for(int i = 0; i < times; i++) {
    spotSystem.addGaussian();
  }
}
