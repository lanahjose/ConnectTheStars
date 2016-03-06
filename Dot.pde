class Dot {
  
  int x;
  int y;
  int radius = 10;
  //color background = color(0);
  boolean drawn;
  //color col;
  
  public Dot(int x, int y) {
    this.x = x;
    this.y = y;
    drawn = true;
    //drawDot();
    //this.col = col;
  }
  
  private void drawDot(color col) {
    noStroke();
    if (mouseX >= x - radius && mouseX < x + radius
            && mouseY >= y - radius && mouseY < y + radius) {
      if (col == color(255) || col == color(0)) {
        fill(color(255, 0, 0));
      } else {
        fill(color(140, 230, 140));
      }
    } else {
      fill(col);
    }
    
    ellipseMode(CENTER);
    //fill(col);
    ellipse(x, y, radius, radius);
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  private void eraseDot() {
//    ellipseMode(CENTER);
//    fill(background);
//    ellipse(x, y, radius + 1, radius + 1);
    drawn = false;
  }
  
  private boolean Clicked() {
    int mx = mouseX;
    int my = mouseY;
    return mx >= x - radius && mx < x + radius
            && my >= y - radius && my < y + radius;
  }
}
