int currentScreen;
Menu menu;
Play play;
PImage bg;
import ddf.minim.*;

AudioPlayer[] player;
Minim minim;//audio context
/* 
* Screens:
* 0 - Main Menu
* 1 - Play
*/
boolean bgTrackCondition = false;
void setup() {
  size(600, 600);
  background(0);
  currentScreen = 0;
  bg = loadImage(((int) random(4)) + ".jpg");
  menu = new Menu(bg);
  minim = new Minim(this);
    player = new AudioPlayer[6];
    player[0] = minim.loadFile("Evgeny_Grinko_-_05_-_Sunset.mp3", 2048);
    player[1] = minim.loadFile("59978__blue2107__bubble-pop-editted.wav", 2048);
    player[2] = minim.loadFile("202029__hykenfreak__notification-chime.wav", 2048);
  if(!bgTrackCondition){
    bgTrackCondition= true;   
    player[0].loop();
    player[0].setGain(-15.0);
    player[1].setGain(-10.0);
  }
  print(player[0].isPlaying());
}

void draw() {
  if (currentScreen == 0) {
    menu.drawMenu();
    if (menu.getPlay()) {
      currentScreen = 1;
      play = new Play(menu.getNumDots(), menu.getTurns(), bg);
      
    }
    
  } else if (currentScreen == 1) {
    play.drawPlay();
    if (play.getFinished()) {
      setup();
    }
  }
    
}

void mouseClicked() {
//  if (currentScreen == 1) {
//    play.mouseClickedPlay();
//  }
}

void mouseDragged() {
  if (currentScreen == 1) {
    play.mouseDraggedPlay();
  }
}

//void mousePressed() {
//  if (currentScreen == 1) {
//    play.mousePressedPlay();
//  }
//}

void mouseReleased() {
  if (currentScreen == 1) {
    play.mouseReleasedPlay();
    play.mouseClickedPlay();
  }
}

void keyTyped() {
  if (currentScreen == 1) {
    play.playKeyTyped();
  }
}
void stop()
{
  player[0].close();
  minim.stop();
  super.stop();
}
