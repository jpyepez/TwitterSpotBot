class SpotSysGaussian extends SpotSys{

  PVector meanXY;
  float stdDev;

  SpotSysGaussian(float stdDev_, int sides_, float radius_){
    super(sides_, radius_);
    meanXY = new PVector(width/2, height/2); // always center of sketch for now
    stdDev = stdDev_;
  }

  // add and display gaussian
  void addGaussian() {
    float x = meanXY.x + stdDev*randomGaussian();
    float y = meanXY.y + stdDev*randomGaussian();
    PVector newLoc = new PVector(x, y);
    add(newLoc);
    spots.get(spots.size()-1).display();
  }

}
