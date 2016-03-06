public class Line{
  int x1, y1, x2, y2;
  //color col;
  
  public Line(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    //this.col = col;
    
    
  }
  
  public int getX1() {
    return x1;
  }
  
  public int getY1() {
    return y1;
  }
  
  public int getX2() {
    return x2;
  }
  
  public int getY2() {
    return y2;
  }
  
  public void setX1(int x1) {
    this.x1 = x1;
  }
  
  public void setY1(int y1) {
    this.y1 = y1;
  }
  
  public void setX2(int x2) {
    this.x2 = x2;
  }
  
  public void setY2(int y2) {
    this.y2 = y2;
  }
  
  public void drawLine(color col) {
    stroke(col);
    strokeWeight(3);
    line(x1, y1, x2, y2);
  }
  
  public boolean isEqual(Line otherLine) {
    boolean equal = (otherLine.getX1() == x1 && otherLine.getX2() == x2
      && otherLine.getY1() == y1 && otherLine.getY2() == y2);
    boolean reverseEqual = (otherLine.getX1() == x2 && otherLine.getX2() == x1
      && otherLine.getY1() == y2 && otherLine.getY2() == y1);
      
    return (equal || reverseEqual);
  }
  
  
}

