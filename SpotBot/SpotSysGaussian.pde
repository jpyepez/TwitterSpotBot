class SpotSysGaussian extends SpotSys{

  PVector meanXY;
  float stdDev;

  SpotSysGaussian(float stdDev_){
    super();
    meanXY = new PVector(width/2, height/2); // always center of sketch for now
    stdDev = stdDev_;
  }

  // add and display gaussian
  void add(int sides, float radius) {
    float x = meanXY.x + stdDev*randomGaussian();
    float y = meanXY.y + stdDev*randomGaussian();
    PVector newLoc = new PVector(x, y);
    add(newLoc, sides, radius);
    spots.get(spots.size()-1).display();
  }

  void addMany(int times, int sides, float radius) {
    for(int i = 0; i < times; i++) {
      add(sides, radius);
    }
  }

  void addManyRndRadius(int times, int sides, float radiusMin, float radiusMax) {
    for(int i = 0; i < times; i++) {
      add(sides, random(radiusMin, radiusMax)/constrain(0.25*sides, 1, 10));
    }
  }

}
