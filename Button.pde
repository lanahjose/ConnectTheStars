class Button {
  
  int y;
  String text;
  boolean pressed = false;
  boolean hover = false;
  int counter = 0;
  boolean firstPressed = false;
  //int whichMenu;
  
  public Button(int y, String text) {
    this.y = y;
    this.text = text;
    //pressed = false;
    drawButton();
  }
  
  public void drawButton() {
    noStroke();
    if (text.equals("PLAY")) {
      playButton();
    } else if (text.equals("Back") || text.equals("Done")) {
      backButton();
    } else if (text.equals(">")) {
      rightButton();
    } else if (text.equals("<")) {
      leftButton();
    } else {
      button();
    }
  }
  
  public boolean Hover() {
    return hover;
  }
  
  
  public boolean Pressed() {
    if (pressed) {
      //println("Button pressed!");
      return pressed;
    } else {
      return false;
    }
  }
  
  public void button() {
    int mx = mouseX;
    int my = mouseY;
    if (mx >= 200 && mx < 400
        && my >= y && my < y + 50) {
      fill(color(140, 230, 140));
      rect(200, y, 200, 50);
      if (mousePressed) {
        pressed = true;
      } else {
        pressed = false;
      }
      hover = true;
    } else {
      fill(color(101, 164, 221));
      rect(200, y, 200, 50);
      hover = false;
    }
    fill(color(255));
    textAlign(CENTER);
    textSize(30);
    text(text, 300, y + 35);
  }
  
  public void playButton() {
    int mx = mouseX;
    int my = mouseY;
    if (mx >= 150 && mx < 450
        && my >= y && my < y + 100) {
      fill(color(140, 230, 140));
      rect(150, y, 300, 100);
      if (mousePressed) {
        pressed = true;
      } else {
        pressed = false;
      }
      hover = true;
    } else {
      fill(color(101, 164, 221));
      rect(150, y, 300, 100);
      hover = false;
    }
    fill(color(255));
    textAlign(CENTER);
    textSize(50);
    text(text, 300, y + 65);
  }
  
  public void backButton() {
    int mx = mouseX;
    int my = mouseY;
    if (mx >= 450 && mx < 550
        && my >= y && my < y + 50) {
      fill(color(140, 230, 140));
      rect(450, y, 100, 50);
      if (mousePressed) {
        pressed = true;
      } else {
        pressed = false;
      }
      hover = true;
    } else {
      fill(color(101, 164, 221));
      rect(450, y, 100, 50);
      hover = false;
    }
    fill(color(255));
    textAlign(CENTER);
    textSize(30);
    text(text, 500, y + 35);
  }
  
  public void rightButton() {
    int mx = mouseX;
    int my = mouseY;
    if (mx >= 400 && mx < 450
        && my >= y && my < y + 50) {
      fill(color(140, 230, 140));
      rect(400, y, 50, 50);
      if (mousePressed && counter == 0) {
        pressed = true;
        firstPressed = true;
        counter++;
      } else if (firstPressed && counter < 10) {
        counter++;
        pressed = false;
      } else if (firstPressed && counter == 10) {
        firstPressed = false;
        counter = 0;
      } else {
        pressed = false;
      }
      hover = true;
    } else {
      fill(color(101, 164, 221));
      rect(400, y, 50, 50);
      hover = false;
    }
    fill(color(255));
    textAlign(CENTER);
    textSize(30);
    text(text, 425, y + 35);
  }
  
  public void leftButton() {
    int mx = mouseX;
    int my = mouseY;
    if (mx >= 150 && mx < 200
        && my >= y && my < y + 50) {
      fill(color(140, 230, 140));
      rect(150, y, 50, 50);
      if (mousePressed && counter == 0) {
        pressed = true;
        firstPressed = true;
        counter++;
      } else if (firstPressed && counter < 10) {
        counter++;
        pressed = false;
      } else if (firstPressed && counter == 10) {
        firstPressed = false;
        counter = 0;
      } else {
        pressed = false;
      }
      hover = true;
    } else {
      fill(color(101, 164, 221));
      rect(150, y, 50, 50);
      hover = false;
    }
    fill(color(255));
    textAlign(CENTER);
    textSize(30);
    text(text, 175, y + 35);
  }
}
