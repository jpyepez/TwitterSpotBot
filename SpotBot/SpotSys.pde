class SpotSys {

  ArrayList<Spot> spots;

  SpotSys() {
    spots = new ArrayList<Spot>();
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

  void add(PVector newLoc, int sides, float radius) {
    spots.add(new Spot(newLoc, sides, radius));
  }

  void clear() {
    spots.clear();
  }
}
