public class Closing {
  
  boolean finished;
  Line[] lineArray;
  Dot[] dotArray;
  int lineCount, dotCount;
  Button finishButton;
  PImage bg;
  
  public Closing(Line[] lineArray, int lineCount, Dot[] dotArray, int dotCount, PImage bg) {
    this.lineArray = lineArray;
    this.lineCount = lineCount;
    this.dotArray = dotArray;
    this.dotCount = dotCount;

    finished = false;
    this.bg = bg;
  }
  
  public void drawClosing() {
    background(0);
    image(bg, 0, 0, 600, 600);
    boolean show = false;
    Button showButton = new Button(25, "Constellation");
    
    if (showButton.Hover()) {
      show = true;
    }
    if (show) {
      for (int i = 0; i < lineCount; i++) {
        lineArray[i].drawLine(color(255));
      }
    }
    
    if (show) {
      for (int i = 0; i < dotCount; i++) {       //draws all the dots in dotArray
        dotArray[i].drawDot(color(255, 255, 0));
      }
    } else {
      for (int i = 0; i < dotCount; i++) {       //draws all the dots in dotArray
        dotArray[i].drawDot(color(255));
      }
    }
    
    
    
    finishButton = new Button(525, "Finish");
      if (finishButton.Pressed()) {
        player[1].play();
        finished = true;
        player[1].rewind();
      }
  }
  
  public boolean getFinished() {
    return finished;
  }
}
