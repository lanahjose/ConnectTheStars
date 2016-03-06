public class Play{
  
  String gameMode;
  int currentPlayer;
  BuilderA builderA;
  BuilderB builderB;
  Dot[] dotArray;
  Line[] lineArray;
  int numDots = 5;
  int turns = 2;
  int turnCount;
  boolean finished;
  int maxLines = numDots * turns * 5;
  Closing closing;
  PImage bg;
  
  public Play(int numDots, int turns, PImage bg) {
    //this.gameMode = gameMode;
    this.numDots = numDots;
    this.turns = turns;
    this.bg = bg;
    currentPlayer = 1;
    dotArray = new Dot[numDots * turns];
    lineArray = new Line[maxLines];
    builderA = new BuilderA(numDots, dotArray, lineArray, bg);
    builderB = new BuilderB(dotArray, lineArray, bg);
    turnCount = 0;
    finished = false;
    
  }
  
  void drawPlay() {
    if(currentPlayer == 3) {
      closing.drawClosing();
      if (closing.getFinished()) {
        finished = true;
      }
    } else if(turnCount == turns) {
      currentPlayer = 3;
      closing = new Closing(lineArray, builderB.getLineCount(), dotArray, builderB.getDotCount(), bg);
    } else if (currentPlayer == 1) {
      builderA.drawBuilderA();
      if (builderA.getDone()) {
        currentPlayer = 2;
        builderB.reset();
        builderB.setDotCount(builderA.getDotCount());
        builderB.setDotArray(builderA.getDotArray());
        builderB.setLineArray(builderA.getLineArray());
      }
    } else if (currentPlayer == 2) {
      
      builderB.drawBuilderB();
      if (builderB.getDone()) {
        currentPlayer = 1;
        turnCount++;
        builderA.reset();
        builderA.setLines(builderB.getLineCount(), builderB.getLineArray());
        
      }
    }
  }
  
  void mouseClickedPlay() {
    if (currentPlayer == 1) {
      builderA.mouseClickedBuilderA();
    }
  }
  
  public boolean getFinished() {
    return finished;
  }
  
  public int getCurrentPlayer() {
    return currentPlayer;
  }
  
  public Line[] getLineArray() {
    return lineArray;
  }
  
  void mouseDraggedPlay() {
    if (currentPlayer == 2) {
      builderB.mousePressedBuilderB();
    } else if (currentPlayer == 1) {
      builderA.mouseDraggedBuilderA();
    }
  }
  void mouseReleasedPlay() {
    if (currentPlayer == 1) {
      builderA.mouseReleasedBuilderA();
    } else if (currentPlayer == 2) {
      builderB.mouseReleasedBuilderB();
    }
  }
  
  void playKeyTyped() {
    if (currentPlayer == 1) {
      builderA.builderAKeyTyped();
    } else if (currentPlayer == 2) {
      builderB.builderBKeyTyped();
    }
  }
  
  
  
  
}
