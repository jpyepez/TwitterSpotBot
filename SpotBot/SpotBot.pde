import java.util.*;
import com.hamoid.*;

VideoExportClass vec;

SpotSysGaussian spotSystem;

void setup(){
  size(1080, 1080);
  background(255);

  //vec = new VideoExportClass(this, "painterbot.mp4");
  resetSketch();
}

void draw(){
  //vec.saveMovieToggle();
}

void mouseReleased() {
  resetSketch();
  // saveFrame("spotbot+######.jpg");
}

void resetSketch() {
  float stdDev = random(150, 250);
  int numSides = int(random(2, 7));
  float radius = random(20, 50);
  spotSystem = new SpotSysGaussian(stdDev, numSides, radius);

  background(255);
  addSpots((int)random(150, 250));
}

void keyReleased() {
  if(key == ' ') {
    // vec.toggleRecording();
    // saveFrame("spotbot+######.jpg");
  }
}

void addSpots(int times) {
  for(int i = 0; i < times; i++) {
    spotSystem.addGaussian();
  }
}
