class BuilderB {
  
  Dot[] dotArray;
  Line[] lineArray;
  int dotCount, lineCount, start, turn;
  boolean active, done;
  boolean drawingLine;
  boolean doneDrawing;
  int delay;
  int startX, startY;
  int maxLines;
  Dot startDot;
  PImage bg;
  boolean erase;
  boolean dragging;
  
  public BuilderB(Dot[] dotArray, Line[] lineArray, PImage bg) {

    this.dotArray = dotArray;
    this.lineArray = lineArray;
    //this.dotCount = dotCount;
    active = false;
    delay = 0;
    done = false;
    drawingLine = false;
    lineCount = 0;
    doneDrawing = false;
    start = 0;
    turn = 0;
    this.bg = bg;
    erase = false;
    dragging = false;

  }
  
  void drawBuilderB() {
    if (delay < 150) {
      active = false;
      openingScreen();
      delay++;
    } else {
      active = true;
      
      if (erase && lineCount > start) {
        lineCount--;
        lineArray[lineCount] = null;
        erase = false;
      }
      background(0);
      image(bg, 0, 0, 600, 600);
      drawCounter();
      
      for (int i = 0; i < lineCount; i++) {
        if (i < start) {
          lineArray[i].drawLine(color(101, 164, 221));
        } else {
          lineArray[i].drawLine(color(140, 230, 140));
        }
      }
      for (int i = 0; i < dotCount; i++) {
        dotArray[i].drawDot(color(255));
      }
      
      if (doneDrawing) {
        noStroke();
        fill(color(0));
        textAlign(CENTER);
        textSize(20);
        text("You can't draw anymore lines.", 300, 30);
      }
      

      
      Button doneButton = new Button(525, "Done");    //finishes player's turn
      if (doneButton.Pressed() && !drawingLine && !dragging) {
        player[1].play();
        active = false;
        done = true;
        player[1].rewind();
      }
      
      if (mousePressed && drawingLine) {
        stroke(color(140, 230, 140));
        strokeWeight(3);
        line(startX, startY, mouseX, mouseY);
        
      }
    }
  }
  
  public int getDotCount() {
    return dotCount;
  }
  
  public void setDotCount(int dotCount) {
    this.dotCount = dotCount;
  }
  
  public int getLineCount() {
    return lineCount;
  }
  
  public Line[] getLineArray() {
    return lineArray;
  }
  
  public void setLineArray(Line[] newLineArray) {
    lineArray = newLineArray;
  }
  
  public void reset() {
    delay = 0;
    done = false;
    start = lineCount;
    turn++;
  }
  
  public boolean getDone() {
    return done;
  }
  
  void openingScreen() {
    background(0);
    fill(color(255));
    textAlign(CENTER);
    textSize(30);
    text("Player 2", 300, 300);
    
    stroke(color(101, 164, 221));
    strokeWeight(3);
    line(150, 350, 150 + delay * 2, 350);
  }
  
  void mousePressedBuilderB() {
    if (active) {
      dragging = true;
      if (lineCount == lineArray.length) {
        doneDrawing = true;
      } else {
        for (int i = 0; i < dotCount; i++) {
          if (dotArray[i].Clicked() || drawingLine) {
            if (dotArray[i].Clicked() && !drawingLine) {
              startX = dotArray[i].getX();
              startY = dotArray[i].getY();
              startDot = dotArray[i];
              drawingLine = true;
            } else if (dotArray[i].Clicked() && dotArray[i] != startDot) {
              boolean duplicate = false;
              Line line = new Line(startX, startY, dotArray[i].getX(), dotArray[i].getY());
              
              for (int j = 0; j < lineCount; j++) {
//                if ((lineArray[j].getX1() == startX && lineArray[j].getY1() == startY
//                    && lineArray[j].getX2() == dotArray[i].getX() && lineArray[j].getY2() == dotArray[i].getY())
//                    || (lineArray[j].getX2() == startX && lineArray[j].getY2() == startY
//                    && lineArray[j].getX1() == dotArray[i].getX() && lineArray[j].getY1() == dotArray[i].getY())) {
//                if ((lineArray[j].getX1() == startX || lineArray[j].getX1() == dotArray[i].getX())
//                    && (lineArray[j].getX2() == startX || lineArray[j].getX2() == dotArray[i].getX())
//                    && (lineArray[j].getY1() == startY || lineArray[j].getY1() == dotArray[i].getY())            
//                    && (lineArray[j].getY2() == startY || lineArray[j].getY2() == dotArray[i].getY())) {
                if (line.isEqual(lineArray[j])) {
                  duplicate = true;
                  drawingLine = false;
                }
              }
              
              if (!duplicate) {
                println("new line drawn!");
                
                lineArray[lineCount] = line;
                lineCount++;
                drawingLine = false;
              }
            }
            stroke(color(140, 230, 140));
            strokeWeight(3);
            line(startX, startY, mouseX, mouseY);
          }
        }
      }
    }
  }
  
  void mouseReleasedBuilderB() {
    drawingLine = false;
    dragging = false;
  }

  void drawCounter() {
    fill(color(255));
    textAlign(CENTER);
    textSize(20);
    textAlign(LEFT);
    text("  Turn " + turn + "/" + menu.getTurns(), 0, 30);
    text("  Connect the stars", 0, 550);
    text("  Press 'u' to undo", 0, 570);
    text("  Press 'q' to quit", 0, 590);
  }
  
//  void mouseClickedBuilderB() {
//    if (active) {
//      boolean emptySpace = true;
//      for (int i = 0; i < dotCount; i++) {
//        if (dotArray[i].Clicked()) {
//          dotArray[i] = null;
//          int j = i + 1;
//          while(j < dotArray.length && dotArray[j] != null) {
//            dotArray[j-1] = dotArray[j];
//            dotArray[j] = null;
//            j++;
//          }
//          emptySpace = false;
//          dotCount--;
//        }
//      }
//      if (emptySpace && dotCount < numDots) {
//        Dot dot = new Dot(mouseX, mouseY, color(255));
//        dotArray[dotCount] = dot;
//        dotCount++;
//      }
//    }
//  }
  
  public Dot[] getDotArray() {
    return dotArray;
  }
  
  public void setDotArray(Dot[] dotArray) {
    this.dotArray = dotArray;
  }
  
  void builderBKeyTyped() {
    if (key == 'q') {
      setup();
    }
    if (key == 'u') {
      erase = true;
    }
  }
  

      
}
