class SpotSys {

  ArrayList<Spot> spots;

  int sides;
  float radius;

  SpotSys(int sides_, float radius_) {
    spots = new ArrayList<Spot>();
    sides = sides_;
		radius = radius_;
  }

  void update() {
    Iterator<Spot> itr = spots.iterator();
    while(itr.hasNext()){
      Spot spot  = itr.next();
      spot.update();
    }
  }

  void display() {
    Iterator<Spot> itr = spots.iterator();
    while(itr.hasNext()){
      Spot spot  = itr.next();
      spot.display();
    }
  }

  void add(PVector newLoc) {
    spots.add(new Spot(newLoc, sides, radius));
  }

  void clear() {
    spots.clear();
  }
}
