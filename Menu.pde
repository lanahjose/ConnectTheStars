class Menu {
  int whichMenu = 0;
  /*
  * 0 - Main Menu
  * 1 - Play
  * 2 - Difficulty
  * 3 - Instructions
  * 4 - Credits
  * 5 - Settings
  */
  
//  String currentDifficulty = "Easy";
//  String currentMode = "FreeStyle";
  int numDots, turns;
  
  boolean play;
  PImage bg;
  
  
  public Menu(PImage bg) {
    //whichMenu = 0;
    play = false;
    numDots = 5;
    turns = 3;
    this.bg = bg;

  }
  
  public boolean getPlay() {
    return play;
  }
  
  
  public void drawMenu() {

    background(0);
    image(bg, 0, 0, 600, 600);
    fill(color(255));
    textAlign(CENTER);
    textSize(50);
    text("CONNECT THE STARS", 300, 100);
    textSize(25);
    text("The Silent Game Edition", 300, 125);
    if (whichMenu == 0) {
      mainMenu();                   //main menu
    } else if (whichMenu == 1) {
      play = true;                  //play the game
      
//    } else if (whichMenu == 2) {
//      difficultyMenu();
    } else if (whichMenu == 3) {
      instrMenu();                 //instructions
    } else if (whichMenu == 4) {
      creditsMenu();               //credits
    } else if (whichMenu == 5) {
      settingsMenu();       //mode selection
    }
    
    
  }
  
  public void mainMenu() {
    
    Button playButton = new Button(175, "PLAY");
//    Button diffButton = new Button(300, "Difficulty");
    Button settingsButton = new Button(300, "Settings");
    Button instrButton = new Button(375, "Instructions");
    
    Button creditsButton = new Button(450, "Credits");
    
    
    if (playButton.Pressed()) {
      player[1].play();      
      whichMenu = 1;
      player[1].rewind();
//    } else if (diffButton.Pressed()) {
//      whichMenu = 2;
    } else if (instrButton.Pressed()) {
      player[1].play();
      whichMenu = 3;
      player[1].rewind();
    } else if (creditsButton.Pressed()) {
      player[1].play();
      whichMenu = 4;
      player[1].rewind();
    } else if (settingsButton.Pressed()) {
      player[1].play();
      whichMenu = 5;
      player[1].rewind();
    }
  }
  
  
  Button dotsRightButton = new Button(200, ">");
  Button dotsLeftButton = new Button(200, "<");
  Button turnsRightButton = new Button(315, ">");
  Button turnsLeftButton = new Button(315, "<");
  
  public void settingsMenu() {
    fill(color(255));
    textAlign(CENTER);
    textSize(30);
    
    text("Number of Stars per Turn", 300, 185);
    
    dotsRightButton.rightButton();
    dotsLeftButton.leftButton();
    
    text("Number of Turns per Player", 300, 300);
    
    turnsRightButton.rightButton();
    turnsLeftButton.leftButton();
    
    textSize(40);
    text(numDots, 300, 240);
    text(turns, 300, 355);
    
    
    
    
    
    
//    text("Current Mode: ", 300, 185);
//    text(currentMode, 300, 220);
//    
//    
//    
//    Button freeStyleButton = new Button(250, "FreeStyle");
//    Button wordButton = new Button(325, "Word");
//    //Button hardButton = new Button (400, "Hard");
    
    Button backButton = new Button(525, "Back");
    if (backButton.Pressed()) {
      player[1].play();
      whichMenu = 0;
      player[1].rewind();
//    } else if (freeStyleButton.Pressed()) {
//      currentMode = "FreeStyle";
//    } else if (wordButton.Pressed()) {
//      currentMode = "Word";
    } else if (dotsRightButton.Pressed() && numDots < 25) {
      player[1].play();
      numDots++;
      player[1].rewind();
    } else if (dotsLeftButton.Pressed() && numDots > 2) {
      player[1].play();
      numDots--;
      player[1].rewind();
    } else if (turnsRightButton.Pressed() && turns < 10) {
      player[1].play();
      turns++;
      player[1].rewind();
    } else if (turnsLeftButton.Pressed() && turns > 1) {
      player[1].play();
      turns--;
      player[1].rewind();
    }
  }
  
  
  public void instrMenu() {
    fill(color(255));
    textAlign(CENTER);
    //textSize(30);
    //text("Instructions: ", 300, 185);
    
    textSize(22);
    //textAlign(LEFT);
    text("    The goal of Connect the Stars is for", 300, 175);
    text("two players to work together in order to", 300, 205);
    text("create an object.  The two players will", 300, 235);
    text("take turns in the process.  The player who", 300, 265);
    text("goes first will place the stars and the", 300, 295);
    text("second player will try to connect them.", 300, 325);
    text("Every turn after the first turn, the first", 300, 355);
    text("player is able to move the stars placed in", 300, 385);
    text("previous turns.  The players are limited", 300, 415);
    text("by the number of stars and number of turns", 300, 445);
    text("to create their object.  These two variables", 300, 475);
    text("are adjustable in the Settings menu.", 300, 505);
    
    Button backButton = new Button(525, "Back");
    if (backButton.Pressed()) {
      player[1].play();
      whichMenu = 0;
      player[1].rewind();
    }
  }
  
  public void creditsMenu() {
    fill(color(255));
    textAlign(CENTER);
    textSize(20);
    text("Lanah Marie Jose: Concept Builder", 300, 200);
    text("Charles Lee: Craft Engineer", 300, 230);
    text("Brenda Lin: Affect Architect", 300, 260);
    text("Richard Valentine: Game Mechanic", 300, 290);
    
    Button backButton = new Button(525, "Back");
    if (backButton.Pressed()) {
      player[1].play();
      whichMenu = 0;
      player[1].rewind();
    }
  }
  
  public int getNumDots() {
    return numDots;
  }
  
  public int getTurns() {
    return turns;
  }
  
  
}
