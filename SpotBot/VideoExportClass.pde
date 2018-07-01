class VideoExportClass extends VideoExport {

  // requires:
  //   import com.hamoid.*;

  boolean recording; 
  int movieDuration;
  int movieFrameRate;

  VideoExportClass(PApplet parent, String filename) {
    super(parent, filename); 
    // public variables
    recording 			= false;	// toggle recording
    movieDuration 	= 15;			// timed recording
    movieFrameRate 	= 60;
    // initialize
    setDebugging(false);
    setQuality(90, 128);
    setFrameRate(movieFrameRate);
    startMovie();
    println("\n\t* VideoExport started.");
  }

  void saveMovieTimed() {
    saveFrame();
    if(frameCount >= movieFrameRate * movieDuration) {
      endMovie();
      println("\n\t* VideoExport finished.");
      println("\tMovie duration: " + movieDuration + " seconds.");
      exit();
    }
  }

  void saveMovieToggle() {
    if(recording) {
      saveFrame();
    }
  }

  void endMovieAndQuit() {
    endMovie();
    println("\n\t* VideoExport finished.");
    exit();
  }

  void toggleRecording() {
    recording = !recording;
    println("VideoExport recording: " + recording);
  }
}
