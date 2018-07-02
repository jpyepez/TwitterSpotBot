class Spot {

  PVector loc;
  int sides, timesDrawn;
  float radius, startAngle;

  Spot(PVector loc_, int sides_, float radius_) {
    loc = loc_.copy();
    radius = radius_;
    sides = sides_;
    timesDrawn = (int)random(1, 25);
    startAngle = getStartAngle();
  }

  void update() {
  }

  void display() {
    for(int i = 0; i < timesDrawn; i++) {
      recCircle(loc, radius, sides);
    }
  }

  void recCircle(PVector newLoc, float newRad, int subCircles) {
    noStroke();
    fill(0, 4);
    ellipse(newLoc.x, newLoc.y, newRad, newRad);
    if(newRad > radius/5) {
      for(int i = 0; i < subCircles; i++) {
        float angleSec = 2*PI/subCircles;
        float angle = startAngle + angleSec*i;
        float x = newLoc.x + newRad * cos(angle);
        float y = newLoc.y + newRad * sin(angle);
        PVector nextLoc = new PVector(x, y);
        recCircle(nextLoc, newRad*random(0.3, 0.7), subCircles);
      }
    }
  }

  float getStartAngle() {
    return int(random(0, 4))*PI/4;
  }
}
