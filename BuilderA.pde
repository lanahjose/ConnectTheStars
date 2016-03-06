class BuilderA {
  
  int numDots;
  Dot[] dotArray;
  Line[] lineArray;
  int dotCount, dotCountTurn, lineCount, turn;
  boolean active, done;
  int delay;
  int start;
  Button doneButton;
  PImage bg;
  boolean dragging, drag;
  Dot draggingDot;
  
  public BuilderA(int numDots, Dot[] dotArray, Line[] lineArray, PImage bg) {
    this.numDots = numDots;
    this.dotArray = dotArray;
    this.lineArray = lineArray;
    dotCount = 0;
    dotCountTurn = 0;
    start = 0;
    active = false;
    delay = 0;
    done = false;
    turn = 1;
    this.bg = bg;
    dragging = false;
    draggingDot = null;
    drag = false;
    
  }
  
  public int getDotCount() {
    return dotCount;
  }
  
  public void setDotCount(int dotCount) {
    this.dotCount = dotCount;
  }
  
  int warningCount = 0;
  boolean warning = false;
  
  void drawBuilderA() {
    if (delay < 150) {
      active = false;
      openingScreen();
      delay++;
    } else {
      active = true;
      background(0);
      image(bg, 0, 0, 600, 600);
      drawCounter();
      
      if (warning) {
        if (warningCount < 100) {
          textSize(40);
          fill(color(255,0,0));
          textAlign(CENTER);
          text("YOU MUST PLOT", 300, 200);
          text("AT LEAST 2 STARS", 300, 275);
          warningCount++;
        } else {
          warning = false;
          warningCount = 0;
        }
      }
      
      for (int i = 0; i < lineCount; i++) {
        lineArray[i].drawLine(color(101, 164, 221));
      }
      
      for (int i = 0; i < dotCount; i++) {       //draws all the dots in dotArray
        if (i < start) {                         //makes dots from past turns diff color
          dotArray[i].drawDot(color(255, 255, 0));
        } else {
          dotArray[i].drawDot(color(255));
        }
      }
      
      
      
      doneButton = new Button(525, "Done");
      if (!dragging && doneButton.Pressed() && !drag) {        //finishes player's turn

        if (dotCount < 2) {
          println("You must plot at least two stars");
          warning = true;
        } else {
                  player[1].play();
        player[1].rewind();
          active = false;
          done = true;
        }
      }
    }
  }
  
  public void setLines(int lineCount, Line[] lineArray) {
    this.lineCount = lineCount;
    this.lineArray = lineArray;
  }
  
  public void reset() {                        //resets player for their new turn
    delay = 0;
    done = false;
    start = dotCount;
    dotCountTurn = 0;
    turn++;
    warning = false;
  }
  
  public boolean getDone() {
    return done;
  }
  
  void openingScreen() {                       //intro screen to player's turn
    background(0);
    fill(color(255));
    textAlign(CENTER);
    textSize(30);
    text("Player 1", 300, 300);
    
    stroke(color(101, 164, 221));
    strokeWeight(3);
    line(150, 350, 150 + delay * 2, 350);
  }
  
  void drawCounter() {                          //indicates how many dots
    fill(color(255));                           //left available to plot
    textSize(20);
    textAlign(RIGHT);
    
    text((numDots - dotCountTurn) + " Stars Left  ", 600, 30);
    
    textAlign(LEFT);
    text("  Turn " + turn + "/" + menu.getTurns(), 0, 30);
    
    if (turn == 1) {
      text("  Click to plot Stars", 0, 550); 
      text("  Press 'q' to quit", 0, 570);
    } else {
      text("  Click to plot Stars", 0, 550); 
      text("  Drag yellow Stars", 0, 570);
      text("  Press 'q' to quit", 0, 590);
    }
  }
  
  void mouseDraggedBuilderA() {
    if (active) {
      drag = true;
      
      for (int i = 0; i < dotCount; i++) {
        if (dotArray[i].Clicked() && i < start) {
          if (!dragging) {
            draggingDot = dotArray[i];
            dragging = true;
          }
          if (dotArray[i] == draggingDot
              && !(mouseX >= 450 && mouseX < 550
              && mouseY >= 525 && mouseY < 575)) {
            for (int j = 0; j < lineCount; j++) {
              if (lineArray[j].getX1() == dotArray[i].getX() && lineArray[j].getY1() == dotArray[i].getY()) {
                lineArray[j].setX1(mouseX);
                lineArray[j].setY1(mouseY);
              }
              if (lineArray[j].getX2() == dotArray[i].getX() && lineArray[j].getY2() == dotArray[i].getY()) {
                lineArray[j].setX2(mouseX);
                lineArray[j].setY2(mouseY);
              }
            }
            dotArray[i].setX(mouseX);
            dotArray[i].setY(mouseY);
          }
            
        }
      }
    }
  }
  
  void mouseReleasedBuilderA() {
    dragging = false;
    draggingDot = null;
    drag = false;
  }
  
  void mouseClickedBuilderA() {
    
    if (active) {
      
      boolean emptySpace = true;
      
      for (int i = 0; i < dotCount; i++) {      //checking to see if
        if (dotArray[i].Clicked()) {           //dot should be erased
          emptySpace = false;
          if (i >= start) {
            dotArray[i] = null;
            int j = i + 1;
            while(j < dotArray.length
                && dotArray[j] != null) {         //moving dots over in array
              dotArray[j-1] = dotArray[j];
              dotArray[j] = null;
              j++;
            }
            dotCount--;
            dotCountTurn--;
          }
           
        }
      }
      if (emptySpace && dotCountTurn < numDots && !doneButton.Pressed()) {   //making new dot
        player[2].play();
        Dot dot = new Dot(mouseX, mouseY);
        dotArray[dotCount] = dot;
        dotCount++;
        dotCountTurn++;
        player[2].rewind();
      }
    }
  }
  
  public Dot[] getDotArray() {
    return dotArray;
  }
  
  public Line[] getLineArray() {
    return lineArray;
  }
  
  void builderAKeyTyped() {
    if (key == 'q') {
      setup();
    }
  }
  

      
}
